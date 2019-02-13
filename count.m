I = imread('FishEgg-2Value_1.4.bmp');%��ȡͼ��
figure(1);   imshow(I);  title('1 ��ֵͼ');%��ʾ��ֵͼ��
bw=bwareaopen(I,100);
figure(2);   imshow(bw);  title('2 ȥ��С������ͼ��');
se = strel('diamond',3);%diamond�ṹԪ��
erodedBW = imerode(bw,se);
figure(3);   imshow(erodedBW);  title('3 ȥ��ճ�����ͼ��');
[B,L] = bwboundaries(erodedBW,'noholes');%ͼ��߽�
figure; imshow(label2rgb(L, @jet, [.5 .5 .5]))%��ͬ��ɫ��ʾ
hold on
for k = 1:length(B)
 boundary = B{k};
 plot(boundary(:,2),boundary(:,1), 'w', 'LineWidth', 1);%��ʾ��ɫ�߽�
end
[L,num] = bwlabel(erodedBW);%--------OOOOOOO
sum=num;
num=1;
for k = 1:length(B)
  boundary = B{k};
  num_string=sprintf('%d',num);%--------OOOOOOO
  text(boundary(1,2)-2,boundary(1,1)+2,num_string,'Color',...
      'k', 'FontSize',12,'FontWeight','bold');%��ע
  num=num+1;
end
title(['��������= ',num2str(sum)]);


