I = imread('FishEgg-2Value_1.4.bmp');%读取图像
figure(1);   imshow(I);  title('1 二值图');%显示二值图像
bw=bwareaopen(I,100);
figure(2);   imshow(bw);  title('2 去除小区域后的图像');
se = strel('diamond',3);%diamond结构元素
erodedBW = imerode(bw,se);
figure(3);   imshow(erodedBW);  title('3 去除粘连后的图像');
[B,L] = bwboundaries(erodedBW,'noholes');%图像边界
figure; imshow(label2rgb(L, @jet, [.5 .5 .5]))%不同颜色显示
hold on
for k = 1:length(B)
 boundary = B{k};
 plot(boundary(:,2),boundary(:,1), 'w', 'LineWidth', 1);%显示白色边界
end
[L,num] = bwlabel(erodedBW);%--------OOOOOOO
sum=num;
num=1;
for k = 1:length(B)
  boundary = B{k};
  num_string=sprintf('%d',num);%--------OOOOOOO
  text(boundary(1,2)-2,boundary(1,1)+2,num_string,'Color',...
      'k', 'FontSize',12,'FontWeight','bold');%标注
  num=num+1;
end
title(['鱼卵数量= ',num2str(sum)]);


