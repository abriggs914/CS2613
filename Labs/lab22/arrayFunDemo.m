a = [4;4];
beta = 7.5;
range = [-4:0.05:8];
[X Y] = meshgrid(range,range);
[rows,cols] = size(X);
tic();
f=@(p,q) delta(beta, a, [p,q]);
Z=arrayfun(f,X,Y);
stop = toc();
printf("time = %f\n", stop);

surf(X,Y,Z);