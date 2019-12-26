struct SetDetector {
    func isSet(_ cards: [[String]]) -> Bool {
        let features = [
            cards.map({$0[0]}),
            cards.map({$0[1]}),
            cards.map({$0[2]}),
            cards.map({$0[3]})
        ]
        return features.allSatisfy{ (feature) -> Bool in
            return feature.allEqual() || feature.allDifferent()
        }
    }
    
    func discoverSets(_ cards : [[String]]) -> [[[String]]] {
        var discoveredSets : [[[String]]] = []
        
        for i in 0..<cards.count - 2 {
            for j in i + 1..<cards.count - 1 {
                for k in j + 1..<cards.count {
                    let possibleSet = [cards[i],cards[j],cards[k]]
                    if isSet(possibleSet) {
                        discoveredSets.append(possibleSet)
                    }
                }
            }
        }
        
        return discoveredSets
    }
}
