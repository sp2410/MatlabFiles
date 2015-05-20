function [x,a,eul,compact,m1,m2,m3,m4,m5,m6,m7,m8,m9,m10,m11,m13,m14,m15,m16,m17,m18,m19,m20,m21,m22] = shapefeature( k )
%conversion of image into black & white image
b=im2bw(k);
%B = bwboundaries(BW) traces the exterior boundaries of objects,
%as well as boundaries of holes inside these objects, in the binary image BW. 
x = bwperim(b);
l=length(b);
a = bwarea(b);
eul = bweuler(b,8);
compact=(l^2)/a;
figure,imshow(x);
title('perimeter');
d1=b;

m=regionprops(d1,'Area');
m1=m.Area;
% the actual number of pixels in the region.

m=regionprops(d1,'Centroid');
m2=m.Centroid;
% 1-by-Q vector that specifies the center of mass of the region.

m=regionprops(d1,'BoundingBox');
m3=m.BoundingBox;
%The smallest rectangle containing the regions

m=regionprops(d1,'SubarrayIdx');
m4=m.SubarrayIdx;
% Cell-array containing indices such that L(idx{:}) extracts the elements
% of L inside the object bounding box.

m=regionprops(d1,'MajorAxisLength');
m5=m.MajorAxisLength;
%Scalar specifying the length (in pixels) of the major axis of the ellipse
%that has the same normalized second central moments as the region.

m=regionprops(d1,'MinorAxisLength');
m6=m.MinorAxisLength;
%; the length (in pixels) of the minor axis of the ellipse that has the
%same normalized second central moments as the region.

m=regionprops(d1,'Eccentricity');
m7=m.Eccentricity;
% Scalar that specifies the eccentricity of the ellipse that has the same second-moments as the region.
%The eccentricity is the ratio of the distance between the foci of the ellipse and its major axis length.

m=regionprops(d1,'Orientation');
m8=m.Orientation;
%the angle (in degrees ranging from -90 to 90 degrees) between the x-axis
%and the major axis of the ellipse that has the same second-moments as the region.

m=regionprops(d1,'ConvexHull');
m9=m.ConvexHull;
%p-by-2 matrix that specifies the smallest convex polygon that can contain
%the region

m=regionprops(d1,'ConvexImage');
m10=m.ConvexImage;
% Binary image (logical) that specifies the convex hull, with all pixels
% within the hull filled in

m=regionprops(d1,'ConvexArea');
m11=m.ConvexArea;
%scalar that specifies the number of pixels in 'ConvexImage'

m=regionprops(d1,'FilledImage');
m13=m.FilledImage;
%Scalar specifying the number of on pixels in FilledImage.

m=regionprops(d1,'FilledArea');
m14=m.FilledArea;
%Binary image (logical) of the same size as the bounding box of the region.
%The on pixels correspond to the region, with all holes filled in.

m=regionprops(d1,'EulerNumber');
m15=m.EulerNumber;
%Scalar that specifies the number of objects in the region minus the number of holes in those objects

m=regionprops(d1,'Extrema');
m16=m.Extrema;

m=regionprops(d1,'EquivDiameter');
m17=m.EquivDiameter;
% Scalar that specifies the diameter of a circle with the same area as the region.

m=regionprops(d1,'Solidity');
m18=m.Solidity;
%specifying the proportion of the pixels in the convex hull that are also in the region

m=regionprops(d1,'Extent');
m19=m.Extent;
%Scalar that specifies the ratio of pixels in the region to pixels in the total bounding box. 
%Computed as the Area divided by the area of the bounding box.

m=regionprops(d1,'PixelIdxList');
m20=m.PixelIdxList;
% p-element vector containing the linear indices of the pixels in the region. 

m=regionprops(d1,'PixelList');
m21=m.PixelList;
% p-by-Q matrix specifying the locations of pixels in the region.

m=regionprops(d1,'Perimeter');
m22=m.Perimeter;
%distance around the boundary of the region. 
%regionprops computes the perimeter by calculating the distance between 
%each adjoining pair of pixels around the border of the region
end

