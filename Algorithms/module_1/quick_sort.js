const fs = require('fs');

function swap(arr, i, j) {
  const v = arr[i];
  arr[i] = arr[j]
  arr[j] = v
}

const runQuickSort = (getPivotIndex) => {
  const quickSort = (arr, start = 0, stopAt = arr.length) => {
    if (stopAt - start <= 1) {
      return 0
    }

    const pivotIndex = getPivotIndex(arr, start, stopAt)
    const pivot = arr[pivotIndex]
// console.log(arr[pivotIndex], arr.slice(start, stopAt))
// console.log("\n******\n")
    let boundary = start;

    if (pivotIndex !== start) {
      swap(arr, start, pivotIndex)
    }

    for (let i = start + 1; i < stopAt; i++) {
      if (arr[i] < pivot) {
        boundary += 1
        swap(arr, i, boundary)
      }
    }

    swap(arr, boundary, start)
    const leftCount = quickSort(arr, start, boundary) // left side
    const rightCount = quickSort(arr, boundary + 1, stopAt) // right side

    return (stopAt - start - 1) + leftCount + rightCount
  }

  return quickSort
}

const arr = JSON.parse(fs.readFileSync('./quick_sort.json', { encoding: 'utf8' }))
// const arr = [8, 2, 4, 5, 7, 1, 9]
// const arr = [5, 3, 1, 8, 9, 2, 60, 20, 30]
// const arr = [2148,9058,7742,3153,6324,609,7628,5469,7017,504,4092,1582,9572,1542,5697,2081,4218,3130,7923,9595]

// // 1. 162085
// const quickSortFirst = runQuickSort((_, start) => start)
// const count = quickSortFirst(arr)

// // 2. 164123
// const quickSortLast = runQuickSort((_, __, stopAt) => stopAt - 1)
// const count = quickSortLast(arr)

// 3. 138527 / 138382
const getMedianPivot = (arr, start, stopAt) => {
  const mid = start + Math.ceil(((stopAt - start) / 2) - 1)

  const startVal = arr[start]
  const lastVal = arr[stopAt - 1]
  const midVal = arr[mid]

  const map = {
    [startVal]: start,
    [lastVal]: stopAt - 1,
    [midVal]: mid,
  }

  const sorted = [startVal, lastVal, midVal].sort((a, b) => a-b);
  // console.log('arr', arr)
  // console.log('sorted', sorted)
  // console.log('base', [startVal, lastVal, midVal])
  // console.log('res', sorted[1], map)
  return map[sorted[1]]
}
const quickSortMedian = runQuickSort(getMedianPivot)
const count = quickSortMedian(arr)

console.log(arr)
console.log(count)
