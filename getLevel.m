function [level] = getLevel(image)
%���ܣ�ʹ���ҸĽ���OTSU�����䷽��ҵ�ͼƬ��һ�����ʵ���ֵ
num_bins = 256;%�Ҷȼ���
image=image*1.4;%  �����ӶԱȶ�
counts = imhist(image);%��ȡͼ��ֱ��ͼ��������  
p = counts / sum(counts);%��һ��ֱ��ͼ������ÿ���Ҷȼ�����ռ�������ı���
omega = cumsum(p);%����p������е��ۼ�
mu = cumsum(p .* (1:num_bins)');%����p�����[1:256]��ˣ�����������ۼ�
mu_t = mu(end);
  
sigma_b_squared = (mu_t * omega - mu).^2 ./ (omega .* (1 - omega));%���㲻ͬ��ֵʱ�ķ����ȡ�����ֵʱ������Ӧ����ǰ��������

maxval = max(sigma_b_squared);%��ȡ���ķ���
idx = mean(find(sigma_b_squared == maxval));%��ȡ�������ʱ��λ�ã����Ҷȵȼ���mean���ֵ
level = (idx - 1) / (num_bins - 1);

end

%1 �������������㣬���ӵ��Ǿ�������㣻2 ���Ҫ������������������������ά����ͬ���Ƕ�ӦԪ�ص���ˣ�
%�����ӵ��ʾ���Ǿ�����ˣ�����ʱ��ͨ���������ʵ�֣���Ҫ����ά��ͬ��Ҳ����ǰһ��������е�ά�����ں�һ���������  ��ά����

