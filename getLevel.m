function [level] = getLevel(image)
%功能：使用我改进的OTSU最大类间方差法找到图片的一个合适的阈值
num_bins = 256;%灰度级数
image=image*1.4;%  我增加对比度
counts = imhist(image);%获取图像直方图数据向量  
p = counts / sum(counts);%归一化直方图，计算每个灰度级像素占整幅画的比例
omega = cumsum(p);%计算p数组各行的累加
mu = cumsum(p .* (1:num_bins)');%矩阵p与矩阵[1:256]相乘，将结果各行累加
mu_t = mu(end);
  
sigma_b_squared = (mu_t * omega - mu).^2 ./ (omega .* (1 - omega));%计算不同阀值时的方差，当取最佳阈值时，背景应该与前景差别最大

maxval = max(sigma_b_squared);%获取最大的方差
idx = mean(find(sigma_b_squared == maxval));%获取方差最大时的位置，即灰度等级，mean求均值
level = (idx - 1) / (num_bins - 1);

end

%1 点乘是数组的运算，不加点是矩阵的运算；2 点乘要求参与运算的两个量两必须是维数相同，是对应元素的相乘；
%而不加点表示的是矩阵相乘（除的时候通过逆矩阵来实现），要求内维相同，也就是前一个矩阵的列的维数等于后一个矩阵的行  的维数。


