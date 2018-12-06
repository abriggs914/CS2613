function normimg = norm2(X,Y)
  %[Dx, Dy] = gradient(img);
  normimg = sqrt(X.^2 + Y.^2);
  #normimg = vecnorm(cat(Dx,Dy),2,3);
endfunction
