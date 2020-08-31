const getClosest = (xSorted, ySorted) => {
  if (xSorted.length === 1) {
    return Math.abs(xSorted[0] - xSorted[1]) + Math.abs(ySorted[0] - ySorted[1]);
  }

  const xLeft = xSorted.splice(0, xSorted.length/2);
  const xRight = xSorted.splice(xSorted.length/2, xSorted.length);

  const yLeft = ySorted.splice(0, ySorted.length/2);
  const yRight = ySorted.splice(ySorted.length/2, ySorted.length);

  const left = getClosest(xLeft, yLeft);
  const right = getClosest(xRight, yRight);

  if ()

}

const closestPoints = (points) => {
  const xSorted = points.sort((a, b) => a[0] - b[0]);
  const ySorted = points.sort((a, b) => a[1] - b[1]);

  const xClosest = getClosest(xSorted, ySorted);
}


const points = [
  [1, 2], [3, 6], [-8,3], [5,4], [0,8], [-9, 5], [0,8], [-9, 5]
]
console.log(closestPoints(points));
