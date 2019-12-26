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
}
