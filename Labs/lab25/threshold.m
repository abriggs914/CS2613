function [rows, cols] = threshold(in, lower)
  [rows,cols] = find(in > lower);
endfunction

%!test
%! A=[1,2,3; 4,5,6];
%!  [rows,cols]=threshold(A,4);
%!  assert(rows==[2;2]);
%!  assert(cols==[2;3]);