function [Y] = toGray(image)
%���ܣ������ͼ��TrueColor-FishEggsSimple.bmpת��Ϊ�Ҷ�ͼ��
[I, MAP]=imread(image);%'TrueColor-FishEggsSimple.bmp' ͼ�����ݶ���������I
%I���󡣿��Է���I��Ϊ333*309*3����һ��3ά����
%��ȡ���ͼ���R��B��G����
R=I(:,:,1);
G=I(:,:,2);
B=I(:,:,3);
Y=0.2989*R+0.5870*G+0.1140*B;%��RGB��ɫ�ռ��У�����ת����ʽ
%imshow(Y);
