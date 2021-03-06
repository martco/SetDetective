# SetDetective

Based on the rules of the card game Set, this package discovers sets within a collection of cards.

### Installation

Add a dependency to the package in your `Packge.swift` file: 

```
dependencies: [
    .package(url: "https://github.com/martco/SetDetective.git", from: "1.0.2")
],
```

Run `swift build`

### About

Each card is represented as an array of 4 strings, with each element of the array referring to a different feature of the card.
For example, a card that has one red solid oval in it would be  `["one", "red", "solid", "ovals"]`. The order of the
features is arbitrary. The labels that you use for each feature value (`ovals` vs `oval`) are also arbitrary.

The order and labels must be consistent, however, for every card that is part of a collection.

An exaple of three cards (which also make a Set):

```
let cards = [
  ["one", "red", "solid", "ovals"],
  ["one", "green", "solid", "ovals"]
  ["one", "purple", "solid", "ovals"]
]

```

### Usage


For `cards` above, `SetDetective().discoverSets(cards)` will return an array containing those cards. `SetDetective` can take an arbitrary number of cards and use them to detect sets. The exampe below shows a full set of 12 cards.

```
import SetDetective

.... 

// each element in the array represents the features in a set card
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

SetDetective().discoverSets(testTableSet)  // returns the 6 sets 
```
