function [feaOut] = featureFunc(point1k)
%用於輸入1000個點，返回測試結果。
%測試結果使用行向量表示
feaNum=6;
feaOut=zeros(1,feaNum);

sample=point1k;
samlen=length(sample);

%% feature


%N: data length

%Approximate Entropy (ApEn)： N = 600, m = 2, and r = 0.2
%近似熵 Approximate Entropy
%function [ApEn] = ApEn(series,dim,r)
feaOut(1)=ApEn(sample,2,0.2);

%%
%Sample Entropy (SampEn)： N = 600, m = 2, and r = 0.2
%样本熵 smaple Entropy
%function SampEnVal = SampEn(data, m, r)
feaOut(2)=SampEn(sample, 2, 0.2);

%%

%Permutation Entropy(PE)： m = 4 and λ = 1
%排列熵 Permutation Entropy
%function [pe hist] = pec(y,m,t)
feaOut(3)=pec(sample,4,1);

%%
%Fuzzy Entropy(FuzzEn)：m = 2, r = 0.3, and q = 2
%模糊熵 Fuzzy Entropy
%function [FuzzyEn] = FuzzyEn(series,dim,r,n)
feaOut(4)=FuzzyEn(sample,2,0.3,2);


% other way
%[I_Cx, I_Cxx, I_xx, H_x, H_xx, H_C] = Fuzzy_MI(sample);
%H_C


%%
%KC Kolmogorov Complexity
%function kc = kc(data)
feaOut(5)=kc(sample);

%%
%6 Spectral entropy
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
feaOut(6)=real(ComOut);

%% remove NaN
feaOut(isnan(feaOut))=0;
%disp(feaOut);
%fprintf("finished One Feature\n");
end