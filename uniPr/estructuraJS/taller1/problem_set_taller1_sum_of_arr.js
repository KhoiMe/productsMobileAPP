function sumArrays(arr1, arr2) {
    const minLength = Math.min(arr1.length, arr2.length);

    let result = [];

    for (let i = 0; i < minLength; i++) {
        result.push(arr1[i] + arr2[i]);
    }

    if (arr1.length > minLength) {
        result = result.concat(arr1.slice(minLength));
    } else if (arr2.length > minLength) {
        result = result.concat(arr2.slice(minLength));
    }

    return result;
}

let array1 = [1, 2, 3, 4, 5];
let array2 = [6, 7, 8, 9, 10, 11, 12];

let resultArray = sumArrays(array1, array2);
console.log("Sum of arrays:", resultArray);
