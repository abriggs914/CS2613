leaf=imread("leaf.jpg");
monoleaf=monochrome(leaf);
[Dx, Dy] = soebel(monoleaf);
ns = norm2(Dx,Dy);
[rows,cols] = threshold(ns,150);
clf
hold on
imshow(leaf);
plot(cols,rows,".","markersize",1);
