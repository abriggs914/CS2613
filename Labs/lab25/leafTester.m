leaf=imread("leaf.jpg");
monoleaf=monochrome(leaf);
[rows, cols] = threshold(monoleaf,200);
clf
hold on;
imshow(leaf);
plot(cols,rows,".","markersize",1);