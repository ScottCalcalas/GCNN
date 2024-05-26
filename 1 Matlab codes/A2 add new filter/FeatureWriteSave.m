
%% test data
%load LDw0all.txt
fprintf("LDw0all readed\n...\n")

%%

Nowdata=LDw0all; %Change Here

dataType=0 %Change Here

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
fprintf("->Begin Calculate\n")
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
    if NowPercent-PrintPercent>0.002
        PrintPercent=NowPercent;
        %disp(NowWrite)
        fprintf("Now:%g\n",PrintPercent);% display
    end
end


save FLDw0all.txt NOWOuput -ascii %Change Here
fprintf("SaveDone");

