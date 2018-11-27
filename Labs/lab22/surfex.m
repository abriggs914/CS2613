a = [4;4];
beta = 7.5;

%% Generating vectors
range = [-4:0.05:8];

% Compute cartesian product (grid)
[X,Y] = meshgrid(range,range);

[rows,cols] = size(X);
tic();
Z = zeros(rows,cols);
for i = 1 : rows
  for j = 1 : cols
    Z(i,j) = delta(beta, a, [X(i,j), Y(i,j)]);
  endfor
endfor
stop = toc();
printf("time = %f\n", stop);

surf(X,Y,Z);