owl=imread("owl.jpg");
monowl=monochrome(owl);
ng = normgrad(monowl);
imshow(ng*2, [0,20]);