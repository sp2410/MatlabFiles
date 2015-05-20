function [] = cancer2(k)
e1 = edge(k,'sobel');
imshow(e1);
s1=imcrop(e1);




end