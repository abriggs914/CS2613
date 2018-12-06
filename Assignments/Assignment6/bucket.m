function res = bucket(v,ranges,p)
  p=3;
  x = linspace(ranges(1,1),ranges(2,1),p+1)
  y = linspace(ranges(1,2),ranges(2,2),p+1)
  z = linspace(ranges(1,3),ranges(2,3),p+1)  
  
  #iris = csvread("iris.csv");

  #[training, testing] = randomsplit(iris, 2/3)

  #p = 2
  #cells = p^(columns(iris)-1)+1

  #minmax = ranges(iris)
  #classes = minmax(2,1) - minmax(1,1) + 1
endfunction
