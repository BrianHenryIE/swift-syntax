//===-------------- OperatorPrecedenceParsing.swift -----------------------===//
//
// This source file is part of the Swift.org open source project
//
// Copyright (c) 2014 - 2022 Apple Inc. and the Swift project authors
// Licensed under Apache License v2.0 with Runtime Library Exception
//
// See https://swift.org/LICENSE.txt for license information
// See https://swift.org/CONTRIBUTORS.txt for the list of Swift project authors
//
//===----------------------------------------------------------------------===//
import SwiftSyntax

extension PrecedenceGroup {
  /// Form the semantic definition of a precedence group given its syntax.
  ///
  /// TODO: This ignores all semantic errors.
  init(from syntax: PrecedenceGroupDeclSyntax) {
    self.name = syntax.identifier.text

    for attr in syntax.groupAttributes {
      // Relation (lowerThan, higherThan)
      if let relation = attr.as(PrecedenceGroupRelationSyntax.self) {
        let isLowerThan = relation.higherThanOrLowerThan.text == "lowerThan"
        for otherGroup in relation.otherNames {
          let otherGroupName = otherGroup.name.text
          self.relations.append(isLowerThan ? .lowerThan(otherGroupName)
                                            : .higherThan(otherGroupName))
        }

        continue
      }

      // Assignment
      if let assignment = attr.as(PrecedenceGroupAssignmentSyntax.self) {
        self.assignment = assignment.flag.text == "true"
        continue
      }

      // Associativity
      if let associativity = attr.as(PrecedenceGroupAssociativitySyntax.self) {
        switch associativity.value.text {
        case "left":
          self.associativity = .left

        case "right":
          self.associativity = .right

        case "none":
          self.associativity = .none

        default:
          break
        }
      }
    }
  }
}

extension Operator {
  /// Form the semantic definition of an operator given its syntax.
  ///
  /// TODO: This ignores all semantic errors.
  init(from syntax: OperatorDeclSyntax) {
    let kindModifier = syntax.modifiers?.first { modifier in
      OperatorKind(rawValue: modifier.name.text) != nil
    }

    if let kindModifier = kindModifier {
      kind = OperatorKind(rawValue: kindModifier.name.text)!
    } else {
      kind = .infix
    }

    name = syntax.identifier.text

    if let groupSyntax = syntax.operatorPrecedenceAndTypes?
        .precedenceGroupAndDesignatedTypes {
      precedenceGroup = groupSyntax.firstToken?.text
    } else {
      precedenceGroup = nil
    }
  }
}

extension OperatorPrecedence {
  /// Integrate the operator and precedence group declarations from the given
  /// source file into the operator precedence tables.
  public mutating func addSourceFile(_ sourceFile: SourceFileSyntax) throws {
    for stmt in sourceFile.statements {
      if let operatorSyntax = stmt.item.as(OperatorDeclSyntax.self) {
        try record(Operator(from: operatorSyntax))
        continue
      }

      if let precedenceGroupSyntax = stmt.item.as(PrecedenceGroupDeclSyntax.self) {
        try record(PrecedenceGroup(from: precedenceGroupSyntax))
        continue
      }
    }
  }
}
