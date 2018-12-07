#Usage
#takes a vector, an array of ranges, and a value.
#returns a vector to which the vector is in
#
#I had some trouble creating a bucket system to
#place my vector. I tried to create a matrix of
#the spacing values so I could decide where the
#vector was. Then I thought about comparing the 
#values of the ranges. By making the vector and
#the array porportional to the sapcing, I would
#be able to calculate how many spaces it was from
#the first index. But I couldn't find a simple way
#to consider all columns without looping.
#I found the function discretize in MATLAB, but it
#says it isn't implemented in Octave yet. I believe
#it's functionality is similar to what I would have
#done here.
function res = bucket(v,rangesA,p)
  x = linspace(rangesA(1,1),rangesA(2,1),p+1);
  y = linspace(rangesA(1,2),rangesA(2,2),p+1);
  %res = repmat(x,p+1,1);
  dist = (x(end)-x(1))/p;
  %xd = discretize(x,v);
  %yd = discretize(y,v);
  xr = x(1:p).*dist;
  yr = y(1:p).*dist;
  vr = v.*dist;
  m = (vr-xr(1:end-1))(1);
  n = (vr-yr(1:end-1))(1);
  #B = reshape(x,p+1, []);
  res = [m,n];
endfunction
