%debug




Nowdata=Lf104; %Change Here

dataType=1 %Change Here

%%
sizeSample=5;
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
for iTimeP=1:2%nTimeP
    NowInput=Nowdata(:,((iTimeP-1)*sizeSample+1):((iTimeP)*sizeSample));
    for iChannel=1:1%nChannel
        NowChannel=NowInput(iChannel,:);
        NowFeature=featureFunc(NowChannel)%
        NowWrite=[iTimeP,iChannel,NowFeature,dataType];
        iNowOutRow=iNowOutRow+1;
        NOWOuput(iNowOutRow,:)=NowWrite;
    end

    NowPercent=iTimeP/nTimeP;% display now calculate
    if NowPercent-PrintPercent>0.05
        PrintPercent=NowPercent;
        %disp(NowWrite)
        fprintf("Now:%g\n",PrintPercent);% display
    end
end


%save Gf104.txt NOWOuput -ascii %Change Here
fprintf("Done\n");

