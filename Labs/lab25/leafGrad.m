leaf=imread("leaf.jpg");
monoleaf= monochrome(leaf,[0.3,0.3,0.3]);
imshow(monoleaf,[0,255]);
ng = normgrad(monoleaf);
[rows, cols] = threshold(ng, 8 );

clf
hold on;
imshow(leaf);
plot(cols,rows,".","markersize",1);