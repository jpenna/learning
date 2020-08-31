let count = 0;

const helper = (arr) => {
  if (arr.length === 1) return arr;

  const leftArr = arr.slice(0, arr.length/2)
  const rightArr = arr.slice(arr.length/2, arr.length);

  const left = helper(leftArr);
  const right = helper(rightArr);

  let i = 0;
  let j = 0;
  const res = [];

  // copy 1
  if (left[i] > right[j]) {
    count++;
    res.push(left[i]);
    i++
  } else {
    res.push(right[j]);
    j++
  }

  // copy 2
  if (left[i] > right[j]) {
    count++;
    res.push(left[i]);
    i++
  } else {
    res.push(right[j]);
    j++
  }

  return res;
}

const secondGreater = (arr) => {
  if (arr.length < 2) return arr;
  return helper(arr)[1];
}


const arr = [5,809, 230,1,2,3,6,9,10,2,4,11,99,89,11, 56,5,809, 230,1,2,3,6,9,10,2,4,11,99,890,1111, 56];
console.log('Result:', secondGreater(arr));
console.log('Length:', arr.length);
console.log('Max comparisons:', arr.length + Math.log2(arr.length) - 2);
console.log('Comparisons:', count);
