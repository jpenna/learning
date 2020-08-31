let count = 0;

const getMax = (arr) => {
  count++;
  const mid = Math.floor(arr.length/2);
  const p = arr[mid];

  const left = arr[mid - 1] || -Infinity;
  const right = arr[mid + 1] || -Infinity;

  if (left < p && right < p) {
    console.log('count', count)
    count = 0;
    return p;
  }
  if (left < p) {
    return getMax(arr.slice(mid));
  } else {
    return getMax(arr.slice(0, mid));
  }
}


const arr1 = [2,3,5,7,8,9,4,2,1]; // 9
const arr2 = [99,90,75,69,57,40,23,11,8,7,6,5,4,3,2,1]; // 99
const arr3 = [1,4,5,7,8,9,10,13,15,17,27,26]; // 27
const arr4 = [1,4,5,7,8,9,10,13,15,17,27]; // 27
console.log(getMax(arr1));
console.log(getMax(arr2));
console.log(getMax(arr3));
console.log(getMax(arr4));
