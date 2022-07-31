%二维离散小波DWT2处理图像
[fn, pn] = uigetfile('*.bmp', '请选择图像文件');
[x, map] = imread(strcat(pn, fn), 'bmp');
I = rgb2gray(x);
sx = size(I);
[cA1, cH1, cV1, cD1] = dwt2(I, 'bior3.7');
xsync = uint8(idwt2(cA1, cH1, cV1, cD1, 'bior3.7', sx));
A1 = uint8(idwt2(cA1, [], [], [], 'bior3.7', sx));
H1 = uint8(idwt2([], cH1, [], [], 'bior3.7', sx));
V1 = uint8(idwt2([], [], cV1, [], 'bior3.7', sx));
D1 = uint8(idwt2([], [], [], cD1, 'bior3.7', sx));
figure;
subplot(2, 3, 1); imshow(x);title('original image');
subplot(2, 3, 2); imshow(uint8(abs(xsync)));title('synthesize image');
subplot(2, 3, 3);mesh(A1);title('app coef. of image ');
subplot(2, 3, 4);mesh(H1);title('hor coef. of image ');
subplot(2, 3, 5);mesh(V1);title('ver coef. of image ');
subplot(2, 3, 6);mesh(D1);title('dia coef. of image ');