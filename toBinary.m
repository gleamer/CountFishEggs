function [ Gray ] = toBinary(image)
%���ܣ����Ҷ�ͼתΪ��ֵͼ
P=imread(image);
%'FishEggsSimple.bmp' ͼ�����ݶ���������P
level=getLevel(toGrayM(image));

%level=0.67;
Gray = zeros(size(P,1), size(P,2));%zeros(333,309)
%size��������ĳߴ硣size(P,1),���ؾ���I����������һά����size(P,2),���ؾ���I��������
%zeros�����Ƿ���һ��m��n��p��...��double�������ע�⣺m, n, p,...�����ǷǸ���������������������0������
for i=1:size(P,1)
    for j=1:size(P,2)
        if P(i, j)>=(level*256)
        Gray(i, j)=255;
        else
        Gray(i, j)=0;
        end
    end
end
Gray= logical(Gray);%��ֹ����ʱ�����double���� ��ʾͼ���ʱ����uint8



