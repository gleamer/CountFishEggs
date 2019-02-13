function [ Gray ] = toBinary(image)
%功能：将灰度图转为二值图
P=imread(image);
%'FishEggsSimple.bmp' 图像数据读入至矩阵P
level=getLevel(toGrayM(image));

%level=0.67;
Gray = zeros(size(P,1), size(P,2));%zeros(333,309)
%size返回数组的尺寸。size(P,1),返回矩阵I的行数（第一维）。size(P,2),返回矩阵I的列数；
%zeros功能是返回一个m×n×p×...的double类零矩阵。注意：m, n, p,...必须是非负整数，负整数将被当做0看待。
for i=1:size(P,1)
    for j=1:size(P,2)
        if P(i, j)>=(level*256)
        Gray(i, j)=255;
        else
        Gray(i, j)=0;
        end
    end
end
Gray= logical(Gray);%防止计算时溢出用double，而 显示图像的时候用uint8



