const fs = require('fs');
const { exit } = require('process');


const getValidIndex = (graph, index) => {
  if (Array.isArray(graph.get(index))) {
    return index;
  }
  return graph.get(index);
}

const doCutGraph = (_graph) => {
  const graph = new Map(_graph); // Map (1: [edges], 2: [edges], ...)
  const resultantGroups = new Map();
  let remainingVertices = graph.size;

  // console.log("\n************** START NEW ***************\n")
// let c = 0
  while (remainingVertices > 2) {
    // console.log(c)
    // c++
    const origin = getValidIndex(graph, Math.ceil(Math.random() * graph.size));
    const originEdges = graph.get(origin);
    const edgeIndex = Math.floor(Math.random() * originEdges.length);

    const next = getValidIndex(graph, originEdges[edgeIndex]);

    if (!resultantGroups.has(origin)) {
      resultantGroups.set(origin, new Set([origin]))
    }
    const mergedVertices = resultantGroups.get(origin).add(next);

    if (resultantGroups.has(next)) {
      resultantGroups.get(next).forEach(node => {
        if (node === origin || node === next) return;
        graph.set(node, origin);
        mergedVertices.add(node);
      });
      resultantGroups.delete(next);
    }

    const mergedEdges = originEdges
      .concat(graph.get(next))
      .filter(vertex => !mergedVertices.has(vertex));

    graph.set(origin, mergedEdges);
    graph.set(next, origin);

    remainingVertices--
  }

  let smallest = Infinity;

  for (let origin of resultantGroups.keys()) {
    const edges = graph.get(origin).length;
    if (edges < smallest) {
      // console.log('size', edges)
      smallest = edges;
    }
  }

  return smallest;
}

const findMinCut = (graph) => {
  // const loops = 1000;
  const loops = Math.floor(Math.pow(graph.length, 2) * Math.log(graph.length));
  console.log('Running # loops:', loops);

  let minCut = Infinity;

  for (let i = 0; i < loops; i++) {
    if (!(i % 5000)) {
      console.log('Running loop', i);
    }
    const countCrossEdges = doCutGraph(graph);
    // console.log('countCrossEdges', countCrossEdges)
    if (countCrossEdges < minCut) {
      minCut = countCrossEdges;
      console.log(`Loop ${i}: ${minCut}`);
    }
  }

  return minCut;
}

const data = JSON.parse(fs.readFileSync('/Users/jpenna/Documents/learning/Algorithms/module_1/karger_min_cut.json', 'utf-8'));
// const data = [
//   [2, 3, 6, 5],
//   [1, 4, 3, 6],
//   [1, 2, 6, 5],
//   [2, 5],
//   [1, 3, 4],
//   [3, 2, 1]
// ]

// [[1, [edges]], [2, [edges]], ...]
const graph = data.map((e, i) => [i + 1, e]);
const minCut = findMinCut(graph);
console.log('Final:', minCut); // 20, 18, 2, 1, 0, 17
