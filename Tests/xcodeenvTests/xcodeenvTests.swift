import XCTest
@testable import xcodeenv

final class xcodeenvTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(xcodeenv().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
