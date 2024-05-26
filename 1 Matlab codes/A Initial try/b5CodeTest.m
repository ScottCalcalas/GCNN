%%
histogram(f101(1,:),BinWidth=10)
%%
plot(f101(1,:))



%%

histogram(f101(2,:),BinWidth=10)



%%
plot(f101(2,:))
%%
histogram(f1011L,BinWidth=10)
%%
f1012L= filter(filterFunc,f101(2,:));
histogram(f1012L)



%% eg
%load f101.txt
f1011=f101(1,:);

subplot(2,1,1);
plot(f1011);

f1011L= filter(filterFunc,f1011);
subplot(2,1,2);
plot(f1011L);

%%


%% spectrogram
f1012=f101(2,:);
TxSignal=f1012;
SamplingFrequency=50;
clear F_xlabel
%% 1 --USE

% 对发送信号进行fft
F_TxSignal = fft(TxSignal./length(TxSignal));
% 取单边带
FSingle_TxSignal = F_TxSignal(1:length(F_TxSignal)/2);
% 符号持续时间
Tsamping = 1/(SamplingFrequency); 
% 总共的点数
SamplingNum = length(F_TxSignal);
% 计算单边带的频率分辨率
for i = 1:length(FSingle_TxSignal)
    F_xlabel(i) = (i-1)/(SamplingNum*Tsamping );
end
% 绘制单边带频谱
figure('Name','Spectrogram','NumberTitle','off')
plot(F_xlabel/1e6, 20*log10(abs(FSingle_TxSignal)),'r');grid on;
% xlim([0 500]);ylim([-140 -40]);
xlabel('Frequency(MHz)');ylabel('Power(dBm)');

%% 2
% 对发送信号进行fft
F_TxSignal = fftshift(fft(TxSignal./length(TxSignal)));
% 符号持续时间
Tsamping = 1/(SamplingFrequency); 
% 总共的点数
SamplingNum = length(F_TxSignal);
% 计算单边带的频率分辨率
for i = 1:length(F_TxSignal )
    F_xlabel(i) = (i-1)/(SamplingNum*Tsamping );
end
% 绘制单边带频谱
%figure(2)
plot(F_xlabel/1e6, 20*log10(abs(F_TxSignal )),'r');grid on;
% xlim([0 500]);ylim([-140 -40]);
xlabel('Frequency(MHz)');ylabel('Power(dBm)');

%%
subplot(2,1,1)
spectrogramFun(f1011)

subplot(2,1,2)
spectrogramFun(f1011L)


%%

%subplot(2,1,1)%for b9

Fs=50; %采样频率 
xn=w001(1,1:1000); 
window=boxcar(length(xn)); %矩形窗 
nfft=1024; 
[Pxx,f]=periodogram(xn,window,nfft,Fs); %直接法 
plot(f,10*log10(Pxx));%--**畫圖




