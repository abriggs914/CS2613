function [Gx,Gy]=soebel(in)
  Dx =[ 1,0,-1;
       2,0,-2;
       1,0,-1];
  Dy = Dx'; % transpose of matrix "'"
  Gx = conv2(in,Dx);
  Gy = conv2(in,Dy);
endfunction

%!demo
%! leaf=imread("leaf.jpg");
%! monoleaf=monochrome(leaf);
%! [Dx, Dy] = soebel(monoleaf);
%! ns = norm2(Dx,Dy);
%! [rows,cols] = threshold(ns,150);
%! clf
%! hold on
%! imshow(leaf);
%! plot(cols,rows,".","markersize",1);
