function canTwoMoviesFillFlight2(movieLengths, flightLength) {

  // Determine if two movie runtimes add up to the flight length
  let movieMap = {}
  movieLengths.forEach(movie => {
    if (movieMap[movie] === undefined) {
      movieMap[movie] = 0
    }
    movieMap[movie] += 1
  })

  for (let key of Object.keys(movieMap)) {
    movieMap[key] -= 1
    if (movieMap[flightLength - key] >= 1) {
      return true
    }
  }
  return false
}

function canTwoMoviesFillFlight(movieLengths, flightLength) {

  // Determine if two movie runtimes add up to the flight length
  let movieLengthsSeen = new Set()

  for (let movieLength of movieLengths) {
    let secondMovieLength = flightLength - movieLength
    if (movieLengthsSeen.has(secondMovieLength)) {
      return true
    }
    movieLengthsSeen.add(movieLength)
  }
  return false
}

// Tests

let desc = 'short flight';
let actual = canTwoMoviesFillFlight([2, 4], 1);
let expected = false;
assertEquals(actual, expected, desc);

desc = 'long flight';
actual = canTwoMoviesFillFlight([2, 4], 6);
expected = true;
assertEquals(actual, expected, desc);

desc = 'one movie half flight length';
actual = canTwoMoviesFillFlight([3, 8], 6);
expected = false;
assertEquals(actual, expected, desc);

desc = 'two movies half flight length';
actual = canTwoMoviesFillFlight([3, 8, 3], 6);
expected = true;
assertEquals(actual, expected, desc);

desc = 'lots of possible pairs';
actual = canTwoMoviesFillFlight([1, 2, 3, 4, 5, 6], 7);
expected = true;
assertEquals(actual, expected, desc);

desc = 'not using first movie';
actual = canTwoMoviesFillFlight([4, 3, 2], 5);
expected = true;
assertEquals(actual, expected, desc);

desc = 'only one movie';
actual = canTwoMoviesFillFlight([6], 6);
expected = false;
assertEquals(actual, expected, desc);

desc = 'no movies';
actual = canTwoMoviesFillFlight([], 2);
expected = false;
assertEquals(actual, expected, desc);

function assertEquals(a, b, desc) {
  if (a === b) {
    console.log(`${desc} ... PASS`);
  } else {
    console.log(`${desc} ... FAIL: ${a} != ${b}`);
  }
}
