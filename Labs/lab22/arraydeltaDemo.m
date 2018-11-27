a = [4;4];
beta = 7.5;

[rows,cols] = size(X);
tic();
range = [-4:0.1:8];
[X Y] = meshgrid(range,range);

Z=arraydelta(beta,a,X,Y);
stop = toc();
printf("time = %f\n", stop);

surf(X,Y,Z);