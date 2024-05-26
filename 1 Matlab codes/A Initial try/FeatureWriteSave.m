

Nowdata=Lf101; %Change Here

dataType=1 %Change Here

%%
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
        NowChannel=NowInput(iChannel,:);
        NowFeature=featureFunc(NowChannel);
        NowWrite=[iTimeP,iChannel,NowFeature,dataType];
        iNowOutRow=iNowOutRow+1;
        NOWOuput(iNowOutRow,:)=NowWrite;
    end

    NowPercent=iTimeP/nTimeP;% display now calculate
    if NowPercent-PrintPercent>0.2
        PrintPercent=NowPercent;
        %disp(NowWrite)
        fprintf("Now:%g\n",PrintPercent);% display
    end
end


save Gf101.txt NOWOuput -ascii %Change Here
fprintf("SaveDone");

