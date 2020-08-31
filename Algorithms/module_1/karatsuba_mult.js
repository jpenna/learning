
let count = 0;
let countSum = 0;

const sumString = (a, b) => {
  countSum += 1;

  if (b.length > a.length) return sumString(b, a);
  const bLength = b.length;
  const aLength = a.length;
  let str = '';
  let rest = 0;
  for (let i = 1; i <= aLength; i++) {
    const val = rest + +(a[aLength - i] || 0) + +(b[bLength - i] || 0);
    str = `${val % 10}${str}`;
    rest = Number.parseInt(val / 10);
  }
  return rest ? `${rest}${str}` : str;
}

const multiply = (_x, _y) => {
  count += 1;
  const x = _x.toString();
  const y = _y.toString();
  const xLength = x.length;
  const yLength = y.length;

  if (xLength <= 2 && yLength <= 2) return (_x * _y).toString();

  const a = x.slice(0, xLength / 2);
  const b = x.slice(xLength / 2, xLength);

  const c = y.slice(0, yLength / 2);
  const d = y.slice(yLength / 2, yLength);

  const first = multiply(a, c);
  const second = multiply(b, d);
  const third = multiply(a, d);
  const fourth = multiply(b, c);

  const sum1 = sumString(`${first}${Array(xLength).fill(0).join('')}`, second)
  const sum2 = sumString(third, fourth)
  return sumString(sum1, `${sum2}${Array(xLength/2).fill(0).join('')}`);
}

const num = multiply('3141592653589793238462643383279502884197169399375105820974944592', '2718281828459045235360287471352662497757247093699959574966967627');
console.log(num);
console.log(count)
console.log(countSum)
