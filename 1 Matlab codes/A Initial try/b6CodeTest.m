Lf1011=Lf101(1,:);
Lf1012=Lf101(2,:);
subplot(2,1,1)
spectrogramFun(Lf1011)

subplot(2,1,2)
spectrogramFun(Lf1012)


%%
600000/(10*60)


% one second have 1000 points

%%

%% test1-1
fprintf("...\n")
load Lf101.txt
fprintf("Lf101 readed\n...\n")
Lf1011=Lf101(1,:);
%% test1-2
sample1=Lf1011(1,1:1000);
featureFunc(sample1)

%%
clc
sample=1:5;

samlen=length(sample);
a=featureFunc(sample)

sqrt(sum(sample.^2)/samlen);


%y=skewness(sample)
X= [1,2,3,4,5];


%%
pxx_norm1=X;
s1= 0;
n = length(pxx_norm1); % nyquist range
for j = 1 : n
    if isfinite(log10(1/pxx_norm1(j)))==1 %%isfinite e' 1 se il numero e' finito
        s1= s1+ pxx_norm1(j)*log10(1/pxx_norm1(j));
    end
end
s1= s1/log10(n);



%%

fea =genFeatureEn(X,{'psdE'});  

%%
plot(1:5,6:10)
%%
Fs=50; %采样频率 
xn=sample1; 
window=boxcar(length(xn)); %矩形窗 
nfft=1024; 
[Pxx,f]=periodogram(xn,window,nfft,Fs); %直接法 
plot(f,10*log10(Pxx));

mean(f)
median(10*log10(Pxx))



