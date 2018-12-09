function out = nbrcount(img)
  x = ones(3);
  out = conv2(img,x,'same') - img;
endfunction

%!test
%! A=       [1,0,0;
%!           0,0,0;
%!           0,0,1;
%!           1,0,0];
%! counts = [0,1,0; 1,2,1; 1,2,0; 0,2,1]
%! assert(nbrcount(A) == counts)

%!test
%! A=       [1,0,0,1,0;
%!           0,1,1,0,1;
%!           0,0,0,1,0;
%!           1,1,0,0,1];
%! counts = [1,3,3,2,2; 2,2,3,4,2; 3,4,4,3,3; 1,1,2,2,1]
%! assert(nbrcount(A) == counts)