// O(1) or constant time
function printFirstItem(items) {
  console.log(items[0])
}

// O(n) or linear time
function printAllItems(items) {
  items.forEach(item => {
    console.log(item);
  });
}

// O(n^2) or quadratic time
function printAllPossibleOrderedPairs(items) {
  items.forEach(firstItem => {
    items.forEach(secondItem => {
      console.log(firstItem, secondItem);
    });
  });
}
