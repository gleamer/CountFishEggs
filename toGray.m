function [Y] = toGray(image)
%功能：将真彩图像TrueColor-FishEggsSimple.bmp转化为灰度图像
[I, MAP]=imread(image);%'TrueColor-FishEggsSimple.bmp' 图像数据读入至矩阵I
%I矩阵。可以发现I阵为333*309*3，是一个3维矩阵
%提取真彩图像的R、B、G分量
R=I(:,:,1);
G=I(:,:,2);
B=I(:,:,3);
Y=0.2989*R+0.5870*G+0.1140*B;%在RGB彩色空间中，亮度转换公式
%imshow(Y);
