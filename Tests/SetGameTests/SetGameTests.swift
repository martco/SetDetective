import XCTest
@testable import SetGame

// example from the box of the board game
let testTableSet = [
  ["red","outlined","two","ovals"],
  ["purple","solid","one","squiggles"],
  ["red","solid","three","diamonds"],
  
  ["green","solid","three","squiggles"],
  ["red","striped","one","diamonds"],
  ["purple","striped","one","ovals"],
  
  ["red","outlined","one","ovals"],
  ["purple","outlined","one","ovals"],
  ["green","solid","two","ovals"],
  
  ["purple","solid","one","ovals"],
  ["red","outlined","three","ovals"],
  ["purple","striped","one","diamonds"],
]

// the box reports these as the six discovered sets
let expectedDiscoveredSets = [
    [
       ["red", "outlined", "two", "ovals"] ,
       ["green", "solid", "three", "squiggles"] ,
       ["purple", "striped", "one", "diamonds"] ,
    ],
    [
       ["red", "outlined", "two", "ovals"] ,
       ["red", "outlined", "one", "ovals"] ,
       ["red", "outlined", "three", "ovals"] ,
    ],
    [
       ["purple", "solid", "one", "squiggles"] ,
       ["red", "solid", "three", "diamonds"] ,
       ["green", "solid", "two", "ovals"] ,
    ],
    [
       ["purple", "solid", "one", "squiggles"] ,
       ["purple", "outlined", "one", "ovals"] ,
       ["purple", "striped", "one", "diamonds"] ,
    ],
    [
       ["purple", "striped", "one", "ovals"] ,
       ["purple", "outlined", "one", "ovals"] ,
       ["purple", "solid", "one", "ovals"] ,
    ],
    [
       ["purple", "striped", "one", "ovals"] ,
       ["green", "solid", "two", "ovals"] ,
       ["red", "outlined", "three", "ovals"] ,
    ],
]



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
            XCTAssertEqual(SetDetector().isSet($0), true)
        }

    }

    func testIsNotSet() {
        let areNotSets = [[
            ["diamonds", "green", "one", "solid"],
            ["diamonds", "purple", "one", "empty"],
            ["diamonds", "red", "one", "empty"]
        ]]

        areNotSets.forEach {
            XCTAssertEqual(SetDetector().isSet($0), false)
        }
    }
    
    func testSetGameCount() {
        XCTAssertEqual(SetGame().deck.count, 81)
    }
    
    func testDiscoverSets() {
        let sd = SetGame()
        sd.setTableSet(testTableSet)
        XCTAssertEqual(sd.discoverSetsOnTable(),expectedDiscoveredSets)
    }
    
    func testSetGameDeal() {
        let sd = SetGame()
        sd.deal()
        XCTAssertEqual(sd.deck.count, 81-12)
        XCTAssertEqual(sd.tableSet.count, 12)
    }

    static var allTests = [
        ("testIsSet", testIsSet),
        ("testIsNotSet", testIsNotSet),
        ("testSetGameCount",testSetGameCount),
        ("testSetGameDeal", testSetGameDeal),
        ("testDiscoverSets", testDiscoverSets)
    ]
}
