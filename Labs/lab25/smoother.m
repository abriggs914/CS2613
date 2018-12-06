A = [0,0,0,0,0,1;
     0,1,1,1,0,0;
     0,1,1,1,0,1;
     0,1,1,1,1,0;
     0,1,1,1,1,0;
     0,0,0,0,0,0];


for j=2:100
  B= ones(j,j)/j^2;
  AB = conv2(A,B);
  imshow(AB,[]); %,[0,1] makes it go from light to dark, [] goes dark to light
  pause(0.0005);
endfor