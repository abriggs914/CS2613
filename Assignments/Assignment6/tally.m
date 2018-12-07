#Usage
#takes in an array and returns the tally of each row in a column matrix
function result = tally(arr)
  [result,c] = max(arr,[],2)
endfunction

%!test
%! A = [1,2,3;
%!     2,1,3;
%!     2,3,1;
%!     3,1,2;
%!     3,2,1;
%!     0,0,0];
%! assert (tally(A) == [3;3;2;1;1;4]);