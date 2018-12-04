A = [0,0,0,0,0,1;
     0,1,1,1,0,0;
     0,1,1,1,0,1;
     0,1,1,1,1,0;
     0,1,1,1,1,0;
     0,0,0,0,0,0];

[Dx, Dy] = gradient(A);

imshow(A);
figure;
imshow(Dx);
figure;
imshow(Dy);
