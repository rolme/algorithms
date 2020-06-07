interface INumberLookUpList {
  [index: number]: number[]
}

// Time Complexity: O(n)
// Space Complexity: O(1)
const numberToSum = (n: number): number => {
  const sNumber = n.toString();
  const length = sNumber.length;
  let total = 0;

  for(let i = 0; i < length; i++) {
    total += parseInt(sNumber.charAt(i));
  }

  return total;
}

// Time Complexity: O(n)
// Space Complexity: O(n)
const sumMaxList = (integers: number[]): INumberLookUpList => {
  if (integers.length === 0) {
    return [];
  }
  const list: INumberLookUpList = {};

  integers.forEach(int => {
    const sum = numberToSum(int);
    if (!Array.isArray(list[sum])) {
      list[sum] = [int];
    } else if (int > list[sum][0]) {
      list[sum][1] = list[sum][0];
      list[sum][0] = int;
    } else if (list[sum][1] === undefined || int > list[sum][1]) {
      list[sum][1] = int;
    }
  });

  return list;
}

// Time Complexity: O(1)
// Space Complexity: O(1)
const sumTotal = (values: number[]): number => {
  if (values.length === 2) {
    return values[0] + values[1];
  }
  return -1;
}

// Time Complexity: O(n)
// Space Complexity: O(n)
const main = () => {
  const list = [51, 71, 17, 26, 42, 12, 1];

  const sumLookupList = sumMaxList(list);
  for (let sum of Object.keys(sumLookupList)) {
    console.log(`sum ${sum}: ${sumTotal(sumLookupList[sum])} [${sumLookupList[sum].join(', ')}]`);
  }  
}

main();