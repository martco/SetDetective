//
//  SetDeck.swift
//  
//  Used as a model to test set detecting algorithm
//  Created by Martin Cortez on 12/25/19.
//

class SetDeck {
    var collection : [[String]]
    
    let shadings = ["striped", "outlined", "solid"]
    let colors = ["purple", "green", "red"]
    let numbers = ["one", "two", "three"]
    let shapes = ["squiggles", "diamonds", "ovals"]
   
    init() {
        self.collection = []
        
        shadings.forEach { shading in
            colors.forEach { color in
                numbers.forEach { number in
                    shapes.forEach { shape in
                        collection.append([shading, color, number, shape])
                    }
                }
            }
        }
        
        print(collection.count)
        print(collection.shuffled())
    }
}
