function out = isolated(img)
  img
  x = nbrcount(img)
  a = size(x,1)
  b = size(x,2)
  for i = 1 : a
    for j = 1 : b
      i
      j
      if x(i,j) > 1
        x(i,j) = 0
      endif
      if x(i,j) == 1
        x(i,j) = 0
      elseif x(i,j) == 0
        x(i,j) = 1
      endif
    endfor
  endfor
  %arrayfun(nbrcount, img)
  out = x
endfunction

%!test
%! A= [1,0,0; 0,0,0; 0,0,1; 1,0,0];
%! assert(isolated(A) == A)

%!test
%! A=[1,0,0;
%!    0,0,0;
%!    0,1,1;
%!    1,0,1];
%! assert(isolated(A) == [1,0,0; 0,0,0; 0,0,0;0,0,0])
