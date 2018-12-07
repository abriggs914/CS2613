#Usage
#takes a vector, an array, and a value.
#Returns the index of the bucket.
#
#I wasn't able to get this function to work
#properly. I couldn't get bucket to produce
#the correct vector, so I struggled trying to
#convert it to a useable index.
function address = hash(v, arr, p)
  arrRange = ranges(arr);
  arr1 = reshape(arr,[],p);
  num = bucket(v,arrRange,p);
  c = sum(num);
  if c == 0
    c = c+1;
  endif
  address = c;
endfunction