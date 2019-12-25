import XCTest
@testable import SetDetector

final class SetDetectorTests: XCTestCase {


    func testIsSet() {
        let areSets = [

            [
                ["ovals", "red", "two", "empty"],
                ["ovals", "red", "two", "striped"],
                ["ovals", "red", "two", "solid"]
            ],
            [
                ["squiggles", "green", "one", "striped"],
                ["ovals", "purple", "two", "striped"],
                ["diamonds", "red", "three", "striped"]
            ],
            [
                ["ovals", "purple", "one", "solid"],
                ["ovals", "purple", "one", "empty"],
                ["ovals", "purple", "one", "shaded"]
            ]
        ]

        areSets.forEach {
            XCTAssertEqual(SetDetector($0).isSet(), true)
        }

    }

    func testIsNotSet() {
        let areNotSets = [[
            ["diamonds", "green", "one", "solid"],
            ["diamonds", "purple", "one", "empty"],
            ["diamonds", "red", "one", "empty"]
        ]]

        areNotSets.forEach {
            XCTAssertEqual(SetDetector($0).isSet(), false)
        }
    }

    static var allTests = [
        ("testIsSet", testIsSet),
        ("testIsNotSet", testIsNotSet),
    ]
}
