# SetDetector

Based on the rules of the card game Set, this package identifies if sets of cards meet the qualifications of a Set.

### Usage

```
import SetDetector

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

SetDetector().discoverSets(testTableSet)  // returns the 6 sets 
```
