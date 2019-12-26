//
//  SetGame.swift
//  
//
//  Created by Martin Cortez on 12/25/19.
//

struct SetGame {
    let setDetector = SetDetector()
    var tableSet : [[String]]
    var deck : [[String]]
    
    func discoverSetsOnTable(_ tableSet : [[String]]) -> [[[String]]] {
        var discoveredSets : [[[String]]] = []
        
        for i in 0..<tableSet.count - 2 {
            for j in i + 1..<tableSet.count - 1 {
                for k in j + 1..<tableSet.count {
                    let possibleSet = [tableSet[i],tableSet[j],tableSet[k]]
                    if setDetector.isSet(possibleSet) {
                        discoveredSets.append(possibleSet)
                    }
                }
            }
        }
        
        return discoveredSets
    }

}
