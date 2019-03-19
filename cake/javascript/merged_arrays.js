// In order to win the prize for most cookies sold, my friend Alice and I are going to merge our Girl Scout Cookies orders and enter as one unit.
//
// Each order is represented by an "order id" (an integer).
//
// We have our lists of orders sorted numerically already, in arrays. Write a method to merge our arrays of orders into one sorted array.
//
// For example:
//
//   my_array     = [3, 4, 6, 10, 11, 15]
// alices_array = [1, 5, 8, 12, 14, 19]
//
// puts merge_arrays(my_array, alices_array)
// # prints [1, 3, 4, 5, 6, 8, 10, 11, 12, 14, 15, 19]
function mergeArrays(myArray, alicesArray) {

  // Combine the sorted arrays into one large sorted array
  let myIndex = 0
  let alicesIndex = 0
  let myLastIndex = myArray.length-1
  let alicesLastIndex = alicesArray.length-1

  combinedArray = []
  while (myIndex <= myLastIndex || alicesIndex <= alicesLastIndex) {
    if (myIndex > myLastIndex) {
      combinedArray.push(alicesArray[alicesIndex])
      alicesIndex += 1
    } else if (alicesIndex > alicesLastIndex) {
      combinedArray.push(myArray[myIndex])
      myIndex += 1
    } else if (myArray[myIndex] <= alicesArray[alicesIndex]) {
      combinedArray.push(myArray[myIndex])
      myIndex += 1
    } else {
      combinedArray.push(alicesArray[alicesIndex])
      alicesIndex += 1
    }
  }

  return combinedArray;
}

// Tests

let desc = 'both arrays are empty';
let actual = mergeArrays([], []);
let expected = [];
assertDeepEqual(actual, expected, desc);

desc = 'first array is empty';
actual = mergeArrays([], [1, 2, 3]);
expected = [1, 2, 3];
assertDeepEqual(actual, expected, desc);

desc = 'second array is empty';
actual = mergeArrays([5, 6, 7], []);
expected = [5, 6, 7];
assertDeepEqual(actual, expected, desc);

desc = 'both arrays have some numbers';
actual = mergeArrays([2, 4, 6], [1, 3, 7]);
expected = [1, 2, 3, 4, 6, 7];
assertDeepEqual(actual, expected, desc);

desc = 'arrays are different lengths';
actual = mergeArrays([2, 4, 6, 8], [1, 7]);
expected = [1, 2, 4, 6, 7, 8];
assertDeepEqual(actual, expected, desc);

function assertDeepEqual(a, b, desc) {
  const aStr = JSON.stringify(a);
  const bStr = JSON.stringify(b);
  if (aStr !== bStr) {
    console.log(`${desc} ... FAIL: ${aStr} != ${bStr}`);
  } else {
    console.log(`${desc} ... PASS`);
  }
}
