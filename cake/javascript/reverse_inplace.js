// arrayOfChars is 0 length, return array.
// arrayOfChars is 1 length, return array.
// arrayOfChars is 2 or more, swap first and last, then go to next character.
// If first and last is the same or first > last return arrayOfChars

function reverse(arrayOfChars) {

  // Reverse the input array of characters in place
  if (arrayOfChars.length <= 1) {
    return arrayOfChars;
  }

  let first = 0
  let last  = arrayOfChars.length - 1

  // ES6
  while (first < last) {
    [arrayOfChars[first], arrayOfChars[last]] = [arrayOfChars[last], arrayOfChars[first]]
    first += 1
    last -= 1
  }
  return arrayOfChars
}

// Tests

let desc = 'empty string';
let input = ''.split('');
reverse(input);
let actual = input.join('');
let expected = '';
assertEqual(actual, expected, desc);

desc = 'single character string';
input = 'A'.split('');
reverse(input);
actual = input.join('');
expected = 'A';
assertEqual(actual, expected, desc);

desc = 'longer string';
input = 'ABCDE'.split('');
reverse(input);
actual = input.join('');
expected = 'EDCBA';
assertEqual(actual, expected, desc);

function assertEqual(a, b, desc) {
  if (a === b) {
    console.log(`${desc} ... PASS`);
  } else {
    console.log(`${desc} ... FAIL: ${a} != ${b}`);
  }
}
