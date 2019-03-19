// I figured out how to get rich: online poker.
//
// I suspect the online poker game I'm playing shuffles cards by doing a single riffle. ↴
//
// To prove this, let's write a method to tell us if a full deck of cards shuffled_deck is a single riffle of two other halves half1 and half2.
//
// We'll represent a stack of cards as an array of integers in the range 1..521..52 (since there are 5252 distinct cards in a deck).
// Why do I care? A single riffle is not a completely random shuffle. If I'm right, I can make more informed bets and get rich and finally prove to my ex that I am not a "loser with an unhealthy cake obsession" (even though it's too late now because she let me go and she's never getting me back).
function isSingleRiffle(half1, half2, shuffledDeck) {

  // Check if the shuffled deck is a single riffle of the halves
  let ih1 = 0
  let ih2 = 0

  for (let card of shuffledDeck) {
    if (card !== half1[ih1] && card !== half2[ih2]) {
      return false
    }

    if (card === half1[ih1]) {
      ih1 += 1
    } else {
      ih2 += 1
    }
  }
  return true
}

// Tests

let desc = 'both halves are the same length';
let actual = isSingleRiffle([1, 4, 5], [2, 3, 6], [1, 2, 3, 4, 5, 6]);
assertEquals(actual, true, desc);

desc = 'halves are different lengths';
actual = isSingleRiffle([1, 5], [2, 3, 6], [1, 2, 6, 3, 5]);
assertEquals(actual, false, desc);

desc = 'one half is empty';
actual = isSingleRiffle([], [2, 3, 6], [2, 3, 6]);
assertEquals(actual, true, desc);

desc = 'shuffled deck is missing cards';
actual = isSingleRiffle([1, 5], [2, 3, 6], [1, 6, 3, 5]);
assertEquals(actual, false, desc);

desc = 'shuffled deck has extra cards';
actual = isSingleRiffle([1, 5], [2, 3, 6], [1, 2, 3, 5, 6, 8]);
assertEquals(actual, false, desc);

function assertEquals(a, b, desc) {
  if (a === b) {
    console.log(`${desc} ... PASS`);
  } else {
    console.log(`${desc} ... FAIL: ${a} != ${b}`);
  }
}
