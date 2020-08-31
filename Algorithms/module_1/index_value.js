let count = 0;

const hasSameValueIndex = (arr, index = 0) => {
  count++;

  const mid = Math.floor(arr.length/2);
  const val = arr[mid];
  let midIndex = mid + index;

  if (val === midIndex) {
    console.log('count OK', count)
    count = 0;
    return true;
  }
  if (arr.length <= 1) {
    console.log('count emp', count)
    count = 0;
    return false;
  }
  if (val <= 0 || mid > val) {
    return hasSameValueIndex(arr.slice(mid), midIndex);
  }
  // if (mid < val)
  return hasSameValueIndex(arr.slice(0, mid), index);
}


const arr1 = [-4,-3,-2,-1,0,5]; // true
const arr4 = [0,9,10,13,15,19,20]; // true
const arr6 = [-2,-1,0,1,2,3,6,9,10]; // true
const arr3 = [-10,-9,-4,-3,-2,-1,0]; // false
const arr2 = [-4,-3,-2,-1,0,3,5,8,9,10,15]; // false
const arr5 = [1,4,5,6,7]; // false
console.log(hasSameValueIndex(arr1));
console.log(hasSameValueIndex(arr4));
console.log(hasSameValueIndex(arr6));
console.log(hasSameValueIndex(arr2));
console.log(hasSameValueIndex(arr3));
console.log(hasSameValueIndex(arr5));
