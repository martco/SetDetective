class SetDetector {
    let features: [[String]]
    
    init(_ cards: [[String]]) {
        self.features = [
            cards.map({$0[0]}),
            cards.map({$0[1]}),
            cards.map({$0[2]}),
            cards.map({$0[3]})
        ]
    }
    
    func isSet() -> Bool {
        features.allSatisfy{ (feature) -> Bool in
            return feature.allEqual() || feature.allDifferent()
        }
    }
}
