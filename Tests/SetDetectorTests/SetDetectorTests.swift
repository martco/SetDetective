import XCTest
@testable import SetDetector

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

class SetDeck {
    var deck : [[String]]
    var tableSet : [[String]]
    let tableSetSize = 12
    
    let shadings = ["striped", "outlined", "solid"]
    let colors = ["purple", "green", "red"]
    let numbers = ["one", "two", "three"]
    let shapes = ["squiggles", "diamonds", "ovals"]
    
    func shuffle() {
        deck = deck.shuffled()
    }
    
    func setTableSet(_ set: [[String]]) {
        tableSet = set
    }
    
    func deal() {
        setTableSet(Array(deck.prefix(tableSetSize)))
        deck.removeFirst(tableSetSize)
    }
    
    func discoverSetsOnTable() -> [[[String]]] {
        var discoveredSets : [[[String]]] = []
        
        for i in 0..<tableSet.count - 2 {
            let j = i + 1
            
            for j in j..<tableSet.count - 1 {
                let k = j + 1
                
                for k in k..<tableSet.count {
                    print("check", i, j, k)
                    let possibleSet = [tableSet[i],tableSet[j],tableSet[k]]
                    if SetDetector(possibleSet).isSet() {
                        print("this is a set", possibleSet)
                        discoveredSets.append(possibleSet)
                    }
                }
                
            }
        }
        
        discoveredSets.forEach { (set) in
            print("  [")
            set.forEach { (s) in
                print("    ",s,",")
            }
            print("  ],")
        }
        return discoveredSets
                            
    }
   
    init() {
        self.deck = []
        self.tableSet = []
        
        shadings.forEach { sh in
            colors.forEach { c in
                numbers.forEach { n in
                    shapes.forEach { sp in
                        deck.append([sh, c, n, sp])
                    }
                }
            }
        }
    }
}

final class SetDetectorTests: XCTestCase {
    
    func testSetDeckCount() {
        XCTAssertEqual(SetDeck().deck.count, 81)
    }
    
    func testDiscoverSets() {
        let sd = SetDeck()
        sd.setTableSet(testTableSet)
        XCTAssertEqual(sd.discoverSetsOnTable(),expectedDiscoveredSets)
    }
    
    func testSetDeckDeal() {
        let sd = SetDeck()
        sd.deal()
        XCTAssertEqual(sd.deck.count, 81-12)
        XCTAssertEqual(sd.tableSet.count, 12)
    }
    
    func testSetDeckShuffle() {
        let sd = SetDeck()
        let deck = sd.deck
        sd.shuffle()
        let shuffledDeck = sd.deck
        XCTAssertNotEqual(deck[0], shuffledDeck[0])
    }

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
        ("testSetDeckCount",testSetDeckCount),
        ("testSetDeckShuffle",testSetDeckShuffle),
        ("testSetDeckDeal", testSetDeckDeal),
        ("testDiscoverSets", testDiscoverSets)
    ]
}
