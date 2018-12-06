function address = hash(v, arr, p)
  arrRange = ranges(arr)
  arr1 = reshape(arr,[],p)
  num = bucket(v,arrRange,p*size(arr,2))
  c = find(arr, num(1))
  address = c
endfunction