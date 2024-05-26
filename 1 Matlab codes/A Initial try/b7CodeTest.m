

%% test1-1
fprintf("...\n")
load Lf101.txt
fprintf("Lf101 readed\n...\n")
Lf1011=Lf101(1,:);
%% test1-2
sample1=Lf1011(1,1:100);
featureFunc(sample1)


%%
clc
Nowdata=Lf101(:,1:5000);
sample1=1:50;
%Nowdata=sample1;


%code:

dataType=1;
sizeSample=1000;
NeedStorageCol=16+2+1;

%initialize

nTimeP=length(Nowdata(1,:))/sizeSample
nChannel=length(Nowdata(:,1))
%start
NeedStorageRow=nChannel*nTimeP
NOWOuput=zeros(NeedStorageRow,NeedStorageCol);
iNowOutRow=0;
PrintPercent=0;
%%
for iTimeP=1:nTimeP
    NowInput=Nowdata(:,((iTimeP-1)*sizeSample+1):((iTimeP)*sizeSample));
    for iChannel=1:nChannel
        NowChannel=Nowdata(iChannel,:);
        NowFeature=featureFunc(NowChannel);
        NowWrite=[iTimeP,iChannel,NowFeature,dataType];
        iNowOutRow=iNowOutRow+1;
        NOWOuput(iNowOutRow,:)=NowWrite;
    end

    NowPercent=iTimeP/nTimeP;% display now calculate
    if NowPercent-PrintPercent>0.05
        PrintPercent=NowPercent;
        fprintf("%g\n",PrintPercent);% display
    end
end





