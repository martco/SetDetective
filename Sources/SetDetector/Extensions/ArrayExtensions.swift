extension Array where Element : Equatable {
    func allEqual() -> Bool {
        if let firstElem = first {
            return !dropFirst().contains { $0 != firstElem }
        }
        return true
    }
    
    func allDifferent() -> Bool {
        var storage = [first]
        
        for elem in dropFirst() {
            if storage.contains(elem) {
                return false
            }
            storage.append(elem)
        }

        return true
    }
}
