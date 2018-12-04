function normimg = normgrad(img)
  [Dx, Dy] = gradient(img);
  normimg = sqrt(Dx.^2+Dy.^2);
  #normimg = vecnorm(cat(Dx,Dy),2,3);
endfunction
