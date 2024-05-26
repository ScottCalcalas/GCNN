function [] = spectrogramFun(inputDataPlot)

%spectrogram 頻譜圖

TxSignal=inputDataPlot;
SamplingFrequency=50;
%clear F_xlabel


%%
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
%figure('Name','Spectrogram','NumberTitle','off')
plot(F_xlabel/1e6, 20*log10(abs(FSingle_TxSignal)),'b');grid on;
% xlim([0 500]);ylim([-140 -40]);
xlabel('Frequency(MHz)');ylabel('Power(dBm)');

end
