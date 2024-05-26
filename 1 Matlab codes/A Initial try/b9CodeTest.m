


%%dos: enter
% openExample('nnet/NodeClassificationUsingGraphConvolutionalNetworkExample')


%%

%singleData

nowData=Gf101;
startCol=3;
enCol=18;
dataSize=size(nowData)
numi=dataSize(1)/8;

for i=1:3%numi
    startRow=(i-1)*8+1;
    enRow=i*8;
    nowUse=nowData(startRow:enRow,startCol:enCol)
end


%%
a=giveXsigle(Gf103,10)

%%

%subplot(2,1,2)%for b5

Fs=50; %采样频率 
xn=Lw001(1,1:1000); 
window=boxcar(length(xn)); %矩形窗 
nfft=1024; 
[Pxx,f]=periodogram(xn,window,nfft,Fs); %直接法 
plot(f,10*log10(Pxx));%--**畫圖
