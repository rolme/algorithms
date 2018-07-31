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

    // first we reverse all the characters in the entire message
    reverseCharacters(message, 0, message.length - 1);
    // this gives us the right word order
    // but with each word backward

    // now we'll make the words forward again
    // by reversing each word's characters

    // we hold the index of the *start* of the current word
    // as we look for the *end* of the current word
    var currentWordStartIndex = 0;
    for (var i = 0; i <= message.length; i++) {

        // found the end of the current word!
        if (i === message.length || message[i] === ' ') {

            // if we haven't exhausted the string our
            // next word's start is one character ahead
            reverseCharacters(message, currentWordStartIndex, i - 1);
            currentWordStartIndex = i + 1;
        }
    }
}

function reverseCharacters(message, leftIndex, rightIndex) {

    // walk towards the middle, from both sides
    while (leftIndex < rightIndex) {

        // swap the left char and right char
        var temp = message[leftIndex];
        message[leftIndex] = message[rightIndex];
        message[rightIndex] = temp;
        leftIndex++;
        rightIndex--;
    }
}
