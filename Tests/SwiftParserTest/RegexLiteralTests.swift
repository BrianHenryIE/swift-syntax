@_spi(RawSyntax) import SwiftSyntax
@_spi(RawSyntax) import SwiftParser
import XCTest

final class RegexLiteralTests: XCTestCase {
  func testForwardSlash1() {
    assertParse(
      #"""
      /(?<identifier>[[:alpha:]]\w*) = (?<hex>[0-9A-F]+)/
      """#
    )
  }
  func testForwardSlash2() {
    assertParse(
      """
      postfix func /(lhs: Int) -> Int {1/}
      """
    )
  }

  func testEmpty() {
    assertParse("#//#")
  }

  func testExtraneous1() {
    assertParse(
      #"""
      #//#1️⃣#
      """#,
      diagnostics: [
        DiagnosticSpec(locationMarker: "1️⃣", message: "too many '#' characters in closing delimiter")
      ],
      fixedSource: "#//#"
    )
  }
  func testExtraneous2() {
    assertParse(
      """
      #/abc/#1️⃣#
      """,
      diagnostics: [
        DiagnosticSpec(locationMarker: "1️⃣", message: "too many '#' characters in closing delimiter")
      ],
      fixedSource: "#/abc/#"
    )
  }

  func testUnterminated1() {
    assertParse(
      #"""
      #1️⃣
      """#,
      diagnostics: [
        DiagnosticSpec(message: "expected identifier in macro expansion")
      ]
    )
  }
  func testUnterminated2() {
    assertParse(
      #"""
      1️⃣/
      """#,
      diagnostics: [
        DiagnosticSpec(message: "extraneous code '/' at top level")
      ]
    )
  }
  func testUnterminated3() {
    assertParse(
      #"""
      /#1️⃣
      """#,
      diagnostics: [
        DiagnosticSpec(message: "expected identifier in macro expansion")
      ]
    )
  }
  func testUnterminated4() {
    assertParse(
      #"""
      #/1️⃣
      """#,
      diagnostics: [
        DiagnosticSpec(message: "expected '/#' to end regex literal")
      ]
    )
  }
  func testUnterminated5() {
    assertParse(
      #"""
      #//1️⃣
      """#,
      diagnostics: [
        DiagnosticSpec(message: "expected '#' to end regex literal")
      ]
    )
  }
  func testUnterminated6() {
    assertParse(
      #"""
      #///1️⃣
      """#,
      diagnostics: [
        DiagnosticSpec(message: "expected '#' to end regex literal")
      ]
    )
  }
  func testUnterminated7() {
    assertParse(
      #"""
      #/#1️⃣
      """#,
      diagnostics: [
        DiagnosticSpec(message: "expected '/#' to end regex literal")
      ]
    )
  }
  func testUnterminated8() {
    assertParse(
      #"""
      #/##1️⃣
      """#,
      diagnostics: [
        DiagnosticSpec(message: "expected '/#' to end regex literal")
      ]
    )
  }
  func testUnterminated9() {
    assertParse(
      #"""
      #/##/1️⃣
      """#,
      diagnostics: [
        DiagnosticSpec(message: "expected '#' to end regex literal")
      ]
    )
  }
  func testUnterminated10() {
    assertParse(
      #"""
      ##/##/#1️⃣
      """#,
      diagnostics: [
        DiagnosticSpec(message: "expected additional '#' characters in closing delimiter")
      ],
      fixedSource: "##/##/##"
    )
  }
  func testUnterminated11() {
    assertParse(
      #"""
      ##/###1️⃣
      """#,
      diagnostics: [
        DiagnosticSpec(message: "expected '/##' to end regex literal")
      ],
      fixedSource: "##/###/##"
    )
  }
  func testUnterminated12() {
    assertParse(
      #"""
      #/\/#1️⃣
      """#,
      diagnostics: [
        DiagnosticSpec(message: "expected '/#' to end regex literal")
      ],
      fixedSource: #"#/\/#/#"#
    )
  }
  func testUnterminated13() {
    assertParse(
      #"""
      ##/abc/#def1️⃣
      """#,
      diagnostics: [
        DiagnosticSpec(message: "expected '/##' to end regex literal")
      ],
      fixedSource: "##/abc/#def/##"
    )
  }
  func testUnterminated14() {
    assertParse(
      #"""
      ##/abc/def#1️⃣
      """#,
      diagnostics: [
        DiagnosticSpec(message: "expected '/##' to end regex literal")
      ],
      fixedSource: "##/abc/def#/##"
    )
  }

  func testTerminated1() {
    assertParse(
      #"""
      #//#
      """#
    )
  }
  func testTerminated2() {
    assertParse(
      #"""
      #///#
      """#
    )
  }
  func testTerminated3() {
    assertParse(
      #"""
      #/#//#
      """#
    )
  }
  func testTerminated4() {
    assertParse(
      #"""
      ##/##/##
      """#
    )
  }
  func testTerminated5() {
    assertParse(
      #"""
      #/\/#/#
      """#
    )
  }
  func testTerminated6() {
    assertParse(
      #"""
      #/\//#
      """#
    )
  }
  func testTerminated7() {
    assertParse(
      #"""
      #/\\/#
      """#
    )
  }

  func testUnprintable1() {
    assertParse(
      """
      /1️⃣\u{7F}/
      """,
      diagnostics: [
        DiagnosticSpec(message: "unprintable ASCII character found in source file")
      ]
    )
  }
  func testUnprintable2() {
    assertParse(
      """
      #/1️⃣\u{7F}/#
      """,
      diagnostics: [
        DiagnosticSpec(message: "unprintable ASCII character found in source file")
      ]
    )
  }

  func testMultiline1() {
    assertParse(
      """
      #/
      abc1️⃣/#
      """,
      diagnostics: [
        DiagnosticSpec(message: "multi-line regex closing delimiter must appear on new line")
      ]
    )
  }
  func testMultiline2() {
    assertParse(
      """
      #/abc1️⃣
      /#2️⃣
      """,
      diagnostics: [
        DiagnosticSpec(locationMarker: "1️⃣", message: "expected '/#' to end regex literal"),
        DiagnosticSpec(locationMarker: "2️⃣", message: "expected identifier in macro expansion"),
      ]
    )
  }
  func testMultiline3() {
    assertParse(
      """
      #/abc1️⃣
          \t \t /#2️⃣
      """,
      diagnostics: [
        DiagnosticSpec(locationMarker: "1️⃣", message: "expected '/#' to end regex literal"),
        DiagnosticSpec(locationMarker: "2️⃣", message: "expected identifier in macro expansion"),
      ]
    )
  }
  func testMultiline4() {
    assertParse(
      """
      #/
       abc
          \t \t /#
      """
    )
  }
  func testMultiline5() {
    assertParse(
      """
      #/
      #1️⃣/#
      """,
      diagnostics: [
        DiagnosticSpec(message: "multi-line regex closing delimiter must appear on new line")
      ]
    )
  }
  func testOpeningSpace1() {
    assertParse(
      """
      1️⃣/ a/
      """,
      diagnostics: [
        DiagnosticSpec(message: "extraneous code '/ a/' at top level")
      ]
    )
  }
  func testOpeningSpace2() {
    assertParse(
      """
      let x = /1️⃣ a/
      """,
      diagnostics: [
        DiagnosticSpec(message: "bare slash regex literal may not start with space")
      ]
    )
  }
  func testOpeningSpace3() {
    assertParse(
      """
      #/ a/#
      """
    )
  }
  func testClosingSpace1() {
    assertParse(
      """
      /a /1️⃣
      """,
      diagnostics: [
        DiagnosticSpec(message: "expected expression after operator")
      ]
    )
  }
  func testClosingSpace2() {
    assertParse(
      """
      let x = /a /1️⃣
      """,
      diagnostics: [
        DiagnosticSpec(message: "expected expression after operator")
      ]
    )
  }
  func testClosingSpace3() {
    assertParse(
      """
      #/a /#
      """
    )
  }
  func testOpeningAndClosingSpace1() {
    assertParse(
      """
      1️⃣/  /
      """,
      diagnostics: [
        DiagnosticSpec(message: "extraneous code '/  /' at top level")
      ]
    )
  }
  func testOpeningAndClosingSpace2() {
    assertParse(
      """
      x += / 1️⃣ /
      """,
      diagnostics: [
        DiagnosticSpec(message: "bare slash regex literal may not end with space")
      ]
    )
  }
  func testOpeningAndClosingSpace3() {
    assertParse(
      """
      #/  /#
      """
    )
  }
  func testOpeningAndClosingSpace4() {
    assertParse(
      """
      1️⃣/ /
      """,
      diagnostics: [
        DiagnosticSpec(message: "extraneous code '/ /' at top level")
      ]
    )
  }
  func testOpeningAndClosingSpace5() {
    assertParse(
      """
      let x = /1️⃣ /
      """,
      diagnostics: [
        DiagnosticSpec(message: "bare slash regex literal may not end with space")
      ]
    )
  }
  func testOpeningAndClosingSpace6() {
    assertParse(
      """
      #/ /#
      """
    )
  }
  func testSingleLineTabChar() {
    // We currently only keep track of one lexer error, so only diagnose the second.
    assertParse(
      """
      #/\t1️⃣\t/#
      """,
      diagnostics: [
        DiagnosticSpec(message: "unprintable ASCII character found in source file")
      ]
    )
  }

  func testBinOpDisambiguation1() {
    assertParse(
      """
      x /^ y ^/ z
      """
    )
  }
  func testBinOpDisambiguation2() {
    assertParse(
      """
      x /^ y/
      """
    )
  }
  func testBinOpDisambiguation3() {
    assertParse(
      """
      x !/^ y/
      """
    )
  }
  func testBinOpDisambiguation4() {
    assertParse(
      """
      x !/^ y !/ z
      """
    )
  }
  func testBinOpDisambiguation5() {
    assertParse(
      """
      try? /^ x/
      """
    )
  }
  func testBinOpDisambiguation6() {
    assertParse(
      """
      try? /^ x ^/
      """
    )
  }
  func testBinOpDisambiguation7() {
    assertParse(
      """
      try! /^ x/
      """
    )
  }
  func testBinOpDisambiguation8() {
    assertParse(
      """
      try? /^ x ^/
      """
    )
  }
  func testBinOpDisambiguation9() {
    assertParse(
      """
      x < /^ }}x/
      """
    )
  }
  func testBinOpDisambiguation10() {
    assertParse(
      """
      { /^ }}x/ }
      """
    )
  }
  func testBinOpDisambiguation11() {
    assertParse(
      """
      ( /^ }}x/ )
      """
    )
  }
  func testBinOpDisambiguation12() {
    assertParse(
      """
      [ /^ }}x/ ]
      """
    )
  }
  func testBinOpDisambiguation13() {
    assertParse(
      """
      foo(&/^ }}x/)
      """
    )
  }
  func testBinOpDisambiguation14() {
    assertParse(
      """
      x; /^ }}x/
      """
    )
  }
  func testBinOpDisambiguation15() {
    assertParse(
      """
      [0 : /^ }}x/]
      """
    )
  }
  func testBinOpDisambiguation16() {
    assertParse(
      """
      (0, /^ }}x/)
      """
    )
  }
  func testBinOpDisambiguation17() {
    assertParse(
      """
      x^ /^ x/
      """
    )
  }
  func testBinOpDisambiguation18() {
    assertParse(
      """
      x! /^ x/
      """
    )
  }
  func testBinOpDisambiguation19() {
    assertParse(
      """
      x? /^ x/
      """
    )
  }
  func testBinOpDisambiguation20() {
    assertParse(
      """
      x > /^ }}x/
      """
    )
  }
  func testBinOpDisambiguation21() {
    assertParse(
      """
      {} /^ x/
      """
    )
  }
  func testBinOpDisambiguation22() {
    assertParse(
      """
      () /^ x/
      """
    )
  }
  func testBinOpDisambiguation23() {
    assertParse(
      """
      [] /^ x/
      """
    )
  }
  func testBinOpDisambiguation24() {
    assertParse(
      """
      x... /^ x/
      """
    )
  }
  func testBinOpDisambiguation25() {
    assertParse(
      """
      x.1️⃣ /^ x/
      """,
      diagnostics: [
        DiagnosticSpec(message: "expected name in member access")
      ]
    )
  }
  func testBinOpDisambiguation26() {
    // FIXME: The diagnostic should be one character back
    assertParse(
      """
      # 1️⃣/^ x/
      """,
      diagnostics: [
        DiagnosticSpec(message: "expected identifier in macro expansion")
      ]
    )
  }
  func testBinOpDisambiguation27() {
    assertParse(
      """
      `x` /^ x/
      """
    )
  }
  func testBinOpDisambiguation28() {
    // FIXME: The diagnostic should be one character back
    assertParse(
      #"""
      \ 1️⃣/^ x/
      """#,
      diagnostics: [
        DiagnosticSpec(message: "expected root in key path")
      ]
    )
  }
  func testBinOpDisambiguation29() {
    assertParse(
      """
      x /^ x/
      """
    )
  }
  func testBinOpDisambiguation30() {
    assertParse(
      """
      true /^ x/
      """
    )
  }
  func testBinOpDisambiguation31() {
    assertParse(
      """
      false /^ x/
      """
    )
  }
  func testBinOpDisambiguation32() {
    assertParse(
      """
      try /^ }}x/
      """
    )
  }
  func testBinOpDisambiguation33() {
    assertParse(
      """
      x as Any /^ x/
      """
    )
  }
  func testBinOpDisambiguation34() {
    assertParse(
      """
      nil /^ x/
      """
    )
  }
  func testBinOpDisambiguation35() {
    assertParse(
      """
      .none /^ x/
      """
    )
  }
  func testBinOpDisambiguation36() {
    assertParse(
      """
      .objc /^ x/
      """
    )
  }
  func testBinOpDisambiguation37() {
    assertParse(
      """
      P.Protocol /^ x/
      """
    )
  }
  func testBinOpDisambiguation38() {
    assertParse(
      """
      self /^ x/
      """
    )
  }
  func testBinOpDisambiguation39() {
    assertParse(
      """
      Self /^ x/
      """
    )
  }
  func testBinOpDisambiguation40() {
    assertParse(
      """
      super /^ x/
      """
    )
  }
  func testBinOpDisambiguation41() {
    // await is a contextual keyword, so we can't assume it must be a regex.
    assertParse(
      """
      await 1️⃣/^ x/
      """,
      diagnostics: [
        DiagnosticSpec(message: "expected expression in 'await' expression")
      ]
    )
  }
  func testBinOpDisambiguation42() {
    // await is a contextual keyword, so we can't assume it must be a regex.
    assertParse(
      """
      ^await /^ x/
      """
    )
  }
  func testBinOpDisambiguation43() {
    assertParse(
      """
      x ? /^ }}x/ : /x/
      """
    )
  }
  func testBinOpDisambiguation44() {
    assertParse(
      """
      x ? /x/ : /^ }}x/
      """
    )
  }
  func testBinOpDisambiguation45() {
    assertParse(
      """
      0 /^ x/
      """
    )
  }
  func testBinOpDisambiguation46() {
    assertParse(
      """
      0.1 /^ x/
      """
    )
  }
  func testBinOpDisambiguation47() {
    assertParse(
      """
      #if /^ }}x/
      #endif
      """
    )
  }
  func testBinOpDisambiguation48() {
    assertParse(
      """
      #if true
      #else
      /^ }}x/
      #endif
      """
    )
  }
  func testBinOpDisambiguation49() {
    assertParse(
      """
      #if true
      #elseif /^ }}x/
      #endif
      """
    )
  }
  func testBinOpDisambiguation50() {
    assertParse(
      """
      #if true
      #endif
      /^ }}x/
      """
    )
  }

  func testNulCharacter() {
    assertParse(
      "/1️⃣\0/",
      diagnostics: [
        DiagnosticSpec(message: "nul character embedded in middle of file", severity: .warning)
      ]
    )
  }
  func testEmoji() {
    assertParse("/👍/")
  }
}
