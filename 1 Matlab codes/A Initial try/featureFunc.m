function [feaOut] = featureFunc(point1k)
%用於輸入1000個點，返回測試結果。
%測試結果使用行向量表示
feaNum=16;
feaOut=zeros(1,feaNum);

sample=point1k;
samlen=length(sample);

%1 Root mean square
feaOut(1)=sqrt(sum(sample.^2)/samlen);
%2 Variance
feaOut(2)=var(sample);
%3 4 (Crests and troughs-)MAX&MIN
feaOut(3)=max(sample);
feaOut(4)=min(sample);
%5 Skewness
feaOut(5)=skewness(sample);
%6 Kurtosis
feaOut(6)=kurtosis(sample);
%7 Hurst exponent
feaOut(7)=estimate_hurst_exponent(sample);%***NEED function-Scott

%8 9 Hjorth-赫约斯移动性(Hjorth Mobility)与赫约斯复杂性(Hjorth Complexity)参数
hMobiity=var(diff(sample))/var(sample);
sampled=diff(sample);
hMobiityd=var(diff(sampled))/var(sampled);
hComplexity=hMobiityd/hMobiity;
feaOut(8)=hMobiity;
feaOut(9)=hComplexity;

%10 Power spectral density
Fs=50; %采样频率 
xn=sample; 
window=boxcar(length(xn)); %矩形窗 
nfft=1024; 
[Pxx,f]=periodogram(xn,window,nfft,Fs); %直接法 
%plot(f,10*log10(Pxx));%--**畫圖
feaOut(10)=mean(f);
feaOut(11)=max(10*log10(Pxx));%峰值
feaOut(12)=median(10*log10(Pxx));%中值
feaOut(13)=min(10*log10(Pxx));


%14 Spectral entropy
%Spectral Entropy (SE)
        % SE is calculated from the normalized power spectrum for whole 
        % nyquist range. The range can be defined by the user as well. 
        % 
        % $$ S = \sum_{f_k=f_1}^{f_K}{P(f_k) \log
        % {\big(\frac{1}{P(f_k)}}\big )}.$
pxx_norm1=sample;
s1= 0;
n = length(pxx_norm1); % nyquist range
for j = 1 : n
    if isfinite(log10(1/pxx_norm1(j)))==1 %%isfinite e' 1 se il numero e' finito
        s1= s1+ pxx_norm1(j)*log10(1/pxx_norm1(j));
    end
end
ComOut=s1/log10(n);
feaOut(14)=real(ComOut);

%15 16 additional
feaOut(15)=mean(sample);
feaOut(16)=std(sample);

end