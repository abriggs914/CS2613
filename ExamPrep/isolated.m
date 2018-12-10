function out = isolated(img)
  x = nbrcount(img);
  for i = 1 : rows(x)
    for j = 1 : columns(x)
      if x(i,j) > 0
        x(i,j) = 0;
      elseif img(i,j) == 1
        x(i,j) = 1;
      endif
    endfor
  endfor
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
