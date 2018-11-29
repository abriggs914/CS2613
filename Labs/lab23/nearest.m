function out = nearest(v, k, data)
  for i=1:rows(data)
    #v(2:end) effectively creates a slice from index 2 to the end
    #data == 3*ones(2,3) returns a matrix of dimensions 2x3 where everything is a 0 except where a (3 * 1) element was.
    dist(i)=norm(v(2:end)-data(i, 2:end));
  endfor
  [sorted, indices]=sort(dist);
  out = sort(indices(1:k));
endfunction

%!test
%! v = [0,1,1]
%! data = [0,0,0; 0,0,1; 0,1,0; 1,1,1]
%! assert(nearest(v,1,data) == 4)
%! assert(nearest(v,3,data) == [2,3,4])