//
//  SetGame.swift
//  
//
//  Created by Martin Cortez on 12/25/19.
//

class SetGame {
    var deck : [[String]]
    var tableSet : [[String]]
    let tableSetSize = 12
    let setDetector = SetDetector()
    
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
                    let possibleSet = [tableSet[i],tableSet[j],tableSet[k]]
                    if setDetector.isSet(possibleSet) {
                        discoveredSets.append(possibleSet)
                    }
                }
                
            }
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
