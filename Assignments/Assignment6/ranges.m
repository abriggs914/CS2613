#Usage 
#returns an array of minimum and maximum values of given array
function res = ranges(array)
  res = [min(array);max(array)];
endfunction

%!test
%! A=[0,0,0;
%!    0,1,0;
%!    0,0,1;
%!    1,1,1];
%! assert (ranges(A), [0,0,0;
%!                     1,1,1]);

%!test
%! A=[0,0,0;
%!    0,10,0;
%!    0,0,1;
%!    1,1,-11];
%! assert (ranges(A), [0,0,-11;
%!                     1,10,1]);

%!test
%! A=[1,2,3;
%!    7,8,9;
%!    4,5,6;
%!    -45,100,8000];
%! assert (ranges(A), [-45,2,3;
%!                     7,100,8000]);