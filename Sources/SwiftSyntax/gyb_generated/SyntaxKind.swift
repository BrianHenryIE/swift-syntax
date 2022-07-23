//// Automatically Generated From SyntaxKind.swift.gyb.
//// Do Not Edit Directly!
//===--------------- SyntaxKind.swift - Syntax Kind definitions -----------===//
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

/// Enumerates the known kinds of Syntax represented in the Syntax tree.
public enum SyntaxKind: UInt16 {
  case token
  case unknown
  case decl
  case expr
  case stmt
  case type
  case pattern
  case unknownDecl
  case unknownExpr
  case unknownStmt
  case unknownType
  case unknownPattern
  case codeBlockItem
  case codeBlockItemList
  case codeBlock
  case inOutExpr
  case poundColumnExpr
  case tupleExprElementList
  case arrayElementList
  case dictionaryElementList
  case stringLiteralSegments
  case tryExpr
  case awaitExpr
  case declNameArgument
  case declNameArgumentList
  case declNameArguments
  case identifierExpr
  case superRefExpr
  case nilLiteralExpr
  case discardAssignmentExpr
  case assignmentExpr
  case sequenceExpr
  case exprList
  case poundLineExpr
  case poundFileExpr
  case poundFileIDExpr
  case poundFilePathExpr
  case poundFunctionExpr
  case poundDsohandleExpr
  case symbolicReferenceExpr
  case prefixOperatorExpr
  case binaryOperatorExpr
  case arrowExpr
  case floatLiteralExpr
  case tupleExpr
  case arrayExpr
  case dictionaryExpr
  case tupleExprElement
  case arrayElement
  case dictionaryElement
  case integerLiteralExpr
  case booleanLiteralExpr
  case ternaryExpr
  case memberAccessExpr
  case isExpr
  case asExpr
  case typeExpr
  case closureCaptureItem
  case closureCaptureItemList
  case closureCaptureSignature
  case closureParam
  case closureParamList
  case closureSignature
  case closureExpr
  case unresolvedPatternExpr
  case multipleTrailingClosureElement
  case multipleTrailingClosureElementList
  case functionCallExpr
  case subscriptExpr
  case optionalChainingExpr
  case forcedValueExpr
  case postfixUnaryExpr
  case specializeExpr
  case stringSegment
  case expressionSegment
  case stringLiteralExpr
  case regexLiteralExpr
  case keyPathExpr
  case keyPathBaseExpr
  case objcNamePiece
  case objcName
  case objcKeyPathExpr
  case objcSelectorExpr
  case postfixIfConfigExpr
  case editorPlaceholderExpr
  case objectLiteralExpr
  case typeInitializerClause
  case typealiasDecl
  case associatedtypeDecl
  case functionParameterList
  case parameterClause
  case returnClause
  case functionSignature
  case ifConfigClause
  case ifConfigClauseList
  case ifConfigDecl
  case poundErrorDecl
  case poundWarningDecl
  case poundSourceLocation
  case poundSourceLocationArgs
  case declModifierDetail
  case declModifier
  case inheritedType
  case inheritedTypeList
  case typeInheritanceClause
  case classDecl
  case actorDecl
  case structDecl
  case protocolDecl
  case extensionDecl
  case memberDeclBlock
  case memberDeclList
  case memberDeclListItem
  case sourceFile
  case initializerClause
  case functionParameter
  case modifierList
  case functionDecl
  case initializerDecl
  case deinitializerDecl
  case subscriptDecl
  case accessLevelModifier
  case accessPathComponent
  case accessPath
  case importDecl
  case accessorParameter
  case accessorDecl
  case accessorList
  case accessorBlock
  case patternBinding
  case patternBindingList
  case variableDecl
  case enumCaseElement
  case enumCaseElementList
  case enumCaseDecl
  case enumDecl
  case operatorDecl
  case identifierList
  case operatorPrecedenceAndTypes
  case precedenceGroupDecl
  case precedenceGroupAttributeList
  case precedenceGroupRelation
  case precedenceGroupNameList
  case precedenceGroupNameElement
  case precedenceGroupAssignment
  case precedenceGroupAssociativity
  case tokenList
  case nonEmptyTokenList
  case customAttribute
  case attribute
  case attributeList
  case specializeAttributeSpecList
  case availabilityEntry
  case labeledSpecializeEntry
  case targetFunctionEntry
  case namedAttributeStringArgument
  case declName
  case implementsAttributeArguments
  case objCSelectorPiece
  case objCSelector
  case differentiableAttributeArguments
  case differentiabilityParamsClause
  case differentiabilityParams
  case differentiabilityParamList
  case differentiabilityParam
  case derivativeRegistrationAttributeArguments
  case qualifiedDeclName
  case functionDeclName
  case backDeployAttributeSpecList
  case backDeployVersionList
  case backDeployVersionArgument
  case continueStmt
  case whileStmt
  case deferStmt
  case expressionStmt
  case switchCaseList
  case repeatWhileStmt
  case guardStmt
  case whereClause
  case forInStmt
  case switchStmt
  case catchClauseList
  case doStmt
  case returnStmt
  case yieldStmt
  case yieldList
  case fallthroughStmt
  case breakStmt
  case caseItemList
  case catchItemList
  case conditionElement
  case availabilityCondition
  case matchingPatternCondition
  case optionalBindingCondition
  case unavailabilityCondition
  case conditionElementList
  case declarationStmt
  case throwStmt
  case ifStmt
  case elseIfContinuation
  case elseBlock
  case switchCase
  case switchDefaultLabel
  case caseItem
  case catchItem
  case switchCaseLabel
  case catchClause
  case poundAssertStmt
  case genericWhereClause
  case genericRequirementList
  case genericRequirement
  case sameTypeRequirement
  case genericParameterList
  case genericParameter
  case primaryAssociatedTypeList
  case primaryAssociatedType
  case genericParameterClause
  case conformanceRequirement
  case primaryAssociatedTypeClause
  case simpleTypeIdentifier
  case memberTypeIdentifier
  case classRestrictionType
  case arrayType
  case dictionaryType
  case metatypeType
  case optionalType
  case constrainedSugarType
  case implicitlyUnwrappedOptionalType
  case compositionTypeElement
  case compositionTypeElementList
  case compositionType
  case tupleTypeElement
  case tupleTypeElementList
  case tupleType
  case functionType
  case attributedType
  case genericArgumentList
  case genericArgument
  case genericArgumentClause
  case typeAnnotation
  case enumCasePattern
  case isTypePattern
  case optionalPattern
  case identifierPattern
  case asTypePattern
  case tuplePattern
  case wildcardPattern
  case tuplePatternElement
  case expressionPattern
  case tuplePatternElementList
  case valueBindingPattern
  case availabilitySpecList
  case availabilityArgument
  case availabilityLabeledArgument
  case availabilityVersionRestriction
  case versionTuple

  var isBase: Bool {
    switch self {
    case .decl: return true
    case .expr: return true
    case .stmt: return true
    case .type: return true
    case .pattern: return true
    case .unknown: return true
    default: return false
    }
  }

  var isSyntaxCollection: Bool {
    switch self {
    case .codeBlockItemList: return true
    case .tupleExprElementList: return true
    case .arrayElementList: return true
    case .dictionaryElementList: return true
    case .stringLiteralSegments: return true
    case .declNameArgumentList: return true
    case .exprList: return true
    case .closureCaptureItemList: return true
    case .closureParamList: return true
    case .multipleTrailingClosureElementList: return true
    case .objcName: return true
    case .functionParameterList: return true
    case .ifConfigClauseList: return true
    case .inheritedTypeList: return true
    case .memberDeclList: return true
    case .modifierList: return true
    case .accessPath: return true
    case .accessorList: return true
    case .patternBindingList: return true
    case .enumCaseElementList: return true
    case .identifierList: return true
    case .precedenceGroupAttributeList: return true
    case .precedenceGroupNameList: return true
    case .tokenList: return true
    case .nonEmptyTokenList: return true
    case .attributeList: return true
    case .specializeAttributeSpecList: return true
    case .objCSelector: return true
    case .differentiabilityParamList: return true
    case .backDeployVersionList: return true
    case .switchCaseList: return true
    case .catchClauseList: return true
    case .caseItemList: return true
    case .catchItemList: return true
    case .conditionElementList: return true
    case .genericRequirementList: return true
    case .genericParameterList: return true
    case .primaryAssociatedTypeList: return true
    case .compositionTypeElementList: return true
    case .tupleTypeElementList: return true
    case .genericArgumentList: return true
    case .tuplePatternElementList: return true
    case .availabilitySpecList: return true
    case .unknown: return true
    default: return false
    }
  }

  var isUnknown: Bool {
    switch self {
    case .unknownDecl: return true
    case .unknownExpr: return true
    case .unknownPattern: return true
    case .unknownStmt: return true
    case .unknownType: return true
    case .unknown: return true
    default: return false
    }
  }
}
