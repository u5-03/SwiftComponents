import XCTest
@testable import SwiftComponents

final class SwiftComponentsTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(SwiftComponents().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
