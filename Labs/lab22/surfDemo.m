r =  [-1:5,05:1];
[X,Y] = meshgrid(r,r);
Z = X.^2-Y.^2;
#% surf(X,Y,Z);

#% clf;
#% colormap ("default");
#% Z = peaks ();
contourf(X,Y,Z);
#%surf (X,Y,Z);
title ({"surf() plot of peaks() function"; "color determined by height Z"});