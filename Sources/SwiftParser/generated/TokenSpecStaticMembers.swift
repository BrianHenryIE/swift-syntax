//// Automatically generated by generate-swiftsyntax
//// Do not edit directly!
//===----------------------------------------------------------------------===//
//
// This source file is part of the Swift.org open source project
//
// Copyright (c) 2014 - 2023 Apple Inc. and the Swift project authors
// Licensed under Apache License v2.0 with Runtime Library Exception
//
// See https://swift.org/LICENSE.txt for license information
// See https://swift.org/CONTRIBUTORS.txt for the list of Swift project authors
//
//===----------------------------------------------------------------------===//

@_spi(RawSyntax) import SwiftSyntax

extension TokenSpec {
  static var arrow: TokenSpec {
    return TokenSpec(.arrow)
  }
  
  static var atSign: TokenSpec {
    return TokenSpec(.atSign)
  }
  
  static var backslash: TokenSpec {
    return TokenSpec(.backslash)
  }
  
  static var backtick: TokenSpec {
    return TokenSpec(.backtick)
  }
  
  static var binaryOperator: TokenSpec {
    return TokenSpec(.binaryOperator)
  }
  
  static var colon: TokenSpec {
    return TokenSpec(.colon)
  }
  
  static var comma: TokenSpec {
    return TokenSpec(.comma)
  }
  
  static var dollarIdentifier: TokenSpec {
    return TokenSpec(.dollarIdentifier)
  }
  
  static var ellipsis: TokenSpec {
    return TokenSpec(.ellipsis)
  }
  
  static var endOfFile: TokenSpec {
    return TokenSpec(.endOfFile)
  }
  
  static var equal: TokenSpec {
    return TokenSpec(.equal)
  }
  
  static var exclamationMark: TokenSpec {
    return TokenSpec(.exclamationMark)
  }
  
  static var floatLiteral: TokenSpec {
    return TokenSpec(.floatLiteral)
  }
  
  static var identifier: TokenSpec {
    return TokenSpec(.identifier)
  }
  
  static var infixQuestionMark: TokenSpec {
    return TokenSpec(.infixQuestionMark)
  }
  
  static var integerLiteral: TokenSpec {
    return TokenSpec(.integerLiteral)
  }
  
  static var leftAngle: TokenSpec {
    return TokenSpec(.leftAngle)
  }
  
  static var leftBrace: TokenSpec {
    return TokenSpec(.leftBrace)
  }
  
  static var leftParen: TokenSpec {
    return TokenSpec(.leftParen)
  }
  
  static var leftSquare: TokenSpec {
    return TokenSpec(.leftSquare)
  }
  
  static var multilineStringQuote: TokenSpec {
    return TokenSpec(.multilineStringQuote)
  }
  
  static var period: TokenSpec {
    return TokenSpec(.period)
  }
  
  static var postfixOperator: TokenSpec {
    return TokenSpec(.postfixOperator)
  }
  
  static var postfixQuestionMark: TokenSpec {
    return TokenSpec(.postfixQuestionMark)
  }
  
  static var pound: TokenSpec {
    return TokenSpec(.pound)
  }
  
  static var poundAvailable: TokenSpec {
    return TokenSpec(.poundAvailable)
  }
  
  static var poundElse: TokenSpec {
    return TokenSpec(.poundElse)
  }
  
  static var poundElseif: TokenSpec {
    return TokenSpec(.poundElseif)
  }
  
  static var poundEndif: TokenSpec {
    return TokenSpec(.poundEndif)
  }
  
  static var poundIf: TokenSpec {
    return TokenSpec(.poundIf)
  }
  
  static var poundSourceLocation: TokenSpec {
    return TokenSpec(.poundSourceLocation)
  }
  
  static var poundUnavailable: TokenSpec {
    return TokenSpec(.poundUnavailable)
  }
  
  static var prefixAmpersand: TokenSpec {
    return TokenSpec(.prefixAmpersand)
  }
  
  static var prefixOperator: TokenSpec {
    return TokenSpec(.prefixOperator)
  }
  
  static var rawStringPoundDelimiter: TokenSpec {
    return TokenSpec(.rawStringPoundDelimiter)
  }
  
  static var regexLiteralPattern: TokenSpec {
    return TokenSpec(.regexLiteralPattern)
  }
  
  static var regexPoundDelimiter: TokenSpec {
    return TokenSpec(.regexPoundDelimiter)
  }
  
  static var regexSlash: TokenSpec {
    return TokenSpec(.regexSlash)
  }
  
  static var rightAngle: TokenSpec {
    return TokenSpec(.rightAngle)
  }
  
  static var rightBrace: TokenSpec {
    return TokenSpec(.rightBrace)
  }
  
  static var rightParen: TokenSpec {
    return TokenSpec(.rightParen)
  }
  
  static var rightSquare: TokenSpec {
    return TokenSpec(.rightSquare)
  }
  
  static var semicolon: TokenSpec {
    return TokenSpec(.semicolon)
  }
  
  static var singleQuote: TokenSpec {
    return TokenSpec(.singleQuote)
  }
  
  static var stringQuote: TokenSpec {
    return TokenSpec(.stringQuote)
  }
  
  static var stringSegment: TokenSpec {
    return TokenSpec(.stringSegment)
  }
  
  static var unknown: TokenSpec {
    return TokenSpec(.unknown)
  }
  
  static var wildcard: TokenSpec {
    return TokenSpec(.wildcard)
  }
  
  static func keyword(_ keyword: Keyword) -> TokenSpec {
    return TokenSpec(keyword)
  }
}
