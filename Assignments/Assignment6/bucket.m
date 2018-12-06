function res = bucket(v,rangesA,p)
  %p=3;
  v
  x = linspace(rangesA(1,1),rangesA(2,1),p+1)
  y = linspace(rangesA(1,2),rangesA(2,2),p+1)
  %res = repmat(x,p+1,1);
  dist = (x(end)-x(1))/p
  m = (x(1:end-1)-v)(1)
  %a = m(1)
  n = (y(1:end-1)-v)(1)
  %b = n(1)
  %n(1)
  res = [m,n]
  %z = linspace(ranges(1,3),ranges(2,3),p+1)  
  
  #iris = csvread("iris.csv");

  #[training, testing] = randomsplit(iris, 2/3)

  #p = 2
  #cells = p^(columns(iris)-1)+1

  #minmax = ranges(iris)
  #classes = minmax(2,1) - minmax(1,1) + 1
endfunction
