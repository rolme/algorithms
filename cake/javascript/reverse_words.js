// You're working on a secret team solving coded transmissions.
//
// Your team is scrambling to decipher a recent message, worried it's a plot to break into a major European National Cake Vault. The message has been mostly deciphered, but all the words are backward! Your colleagues have handed off the last step to you.
//
// Write a function reverseWords() that takes a message as an array of characters and reverses the order of the words in place. ↴
//
// Why an array of characters instead of a string?
//
// The goal of this question is to practice manipulating strings in place. Since we're modifying the message, we need a mutable ↴ type like an array, instead of JavaScript's immutable strings.
//
// For example:
//
//   var message = [ 'c', 'a', 'k', 'e', ' ',
//                 'p', 'o', 'u', 'n', 'd', ' ',
//                 's', 't', 'e', 'a', 'l' ];
//
// reverseWords(message);
//
// console.log(message.join(''));
// // prints: 'steal pound cake'
//
// When writing your function, assume the message contains only letters and spaces, and all words are separated by one space.

// Solution
// We'll write a helper function reverseCharacters() that reverses all the characters between a leftIndex and rightIndex. We use it to:
//
// Reverse all the characters in the entire message, giving us the correct word order but with each word backward.
// Reverse the characters in each individual word.
function reverseWords(message) {

  // Decode the message by reversing the words
  reverseString(message, 0, message.length-1)
  console.log(message.join(''))
  start = 0
  for (i = start; i < message.length; i++) {
    if (message[i] === ' ') {
      reverseString(message, start, i-1)
      start = i + 1
    }

    if (i === message.length - 1) {
      reverseString(message, start, i)
    }
  }
}

function reverseString(str, start, end) {
  while (start < end) {
    [str[start], str[end]] = [str[end], str[start]]
    start += 1
    end -= 1
  }
}

// Tests

let desc = 'one word';
let input = 'vault'.split('');
reverseWords(input);
let actual = input.join('');
let expected = 'vault';
assertEqual(actual, expected, desc);

desc = 'two words';
input = 'thief cake'.split('');
reverseWords(input);
actual = input.join('');
expected = 'cake thief';
assertEqual(actual, expected, desc);

desc = 'three words';
input = 'one another get'.split('');
reverseWords(input);
actual = input.join('');
expected = 'get another one';
assertEqual(actual, expected, desc);

desc = 'multiple words same length';
input = 'rat the ate cat the'.split('');
reverseWords(input);
actual = input.join('');
expected = 'the cat ate the rat';
assertEqual(actual, expected, desc);

desc = 'multiple words different lengths';
input = 'yummy is cake bundt chocolate'.split('');
reverseWords(input);
actual = input.join('');
expected = 'chocolate bundt cake is yummy';
assertEqual(actual, expected, desc);

desc = 'empty string';
input = ''.split('');
reverseWords(input);
actual = input.join('');
expected = '';
assertEqual(actual, expected, desc);

function assertEqual(a, b, desc) {
  if (a === b) {
    console.log(`${desc} ... PASS`);
  } else {
    console.log(`${desc} ... FAIL: ${a} != ${b}`);
  }
}
