const fs = require('fs');

function sortWithInversionCount(arr) {
  if (arr.length === 1) return { sorted: arr, count: 0 };

  const left = arr.slice(0, arr.length / 2);
  const right = arr.slice(arr.length / 2, arr.length);

  const { sorted: sLeft, count: cLeft } = sortWithInversionCount(left);
  const { sorted: sRight, count: cRight } = sortWithInversionCount(right);

  let sorted = [];
  let count = 0;
  let i = 0;
  let j = 0;
  while (i < sLeft.length && j < sRight.length) {
    if (sLeft[i] <= sRight[j]) {
      sorted.push(sLeft[i]);
      i++;
    } else {
      count += sLeft.length - i;
      sorted.push(sRight[j]);
      j++;
    }
  }

  if (i < sLeft.length) {
    sorted = sorted.concat(sLeft.slice(i))
  } else if (j < sRight.length) {
    sorted = sorted.concat(sRight.slice(j))
  }

  return { sorted, count: count + cLeft + cRight };
}

function countInversions(arr) {
  const { sorted, count } = sortWithInversionCount(arr)
  console.log(arr)
  console.log(sorted)
  return count;
}



// const arr = [1,2,3,5,4,8,10,11,9,2,1]
// const arr = [6,5,4,3,2,1]
// const arr = [300, 99, 14, 79, 29, 25, 60,  2, 53, 99, 4, 80]
// console.log(countInversions(arr))

fs.readFile('./int_array.txt', 'utf8', (err, data) => {
  if (err) throw err;
  const arr = data.split("\r\n").map(n => +n);
  console.log(countInversions(arr));
});

// 2408005288
