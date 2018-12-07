#Usage
#Takes in array and ratio, returning two partioned arrays
function [foo, bar] = randomsplit(array, ratio)
  %obtain number of rows in array and compute ratio%
  [m,n] = size(array);
  ratioM = m*ratio;
  idx = randperm(m);
  foo = array(idx(1:ratioM),:); % collect upper array
  bar = array(idx(ratioM+1:end),:); % collect lower array
endfunction

%!assert(randomsplit(zeros(10,1), 0.5) == [zeros(5,1),zeros(5,1)])

%!test
%! [foo, bar] = randomsplit(zeros(10,1), 0.7);
%! assert(foo == zeros(7,1))
%! assert(bar == zeros(3,1))

%!test
%! [a, b] = randomsplit((2*ones(8,2)), 0.25);
%! assert(a == 2*ones(2,1))
%! assert(b == 2*ones(6,1))