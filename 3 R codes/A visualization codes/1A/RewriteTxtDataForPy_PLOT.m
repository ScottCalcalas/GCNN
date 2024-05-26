%% Input
NowNeedChange=FLDq4all;
FeatureNum=16


%% calculate needed space
DataSize=size(NowNeedChange)
TimePoints=DataSize(1)/8

OutMatrix=zeros(8*FeatureNum,TimePoints);

%%

for colnumi=3:18
    nowDataLine=NowNeedChange(:,colnumi);
    FeatureRank=colnumi-2;
    oRowsart=(FeatureRank-1)*8+1;%% use read
    oRowend=(FeatureRank)*8;%% use read

    for TimePi=1:TimePoints
        dRowstart=(TimePi-1)*8+1;
        dRowend=(TimePi)*8;
        OutMatrix(oRowsart:oRowend,TimePi)=nowDataLine(dRowstart:dRowend);
    end
end

%%
writematrix(OutMatrix,'plotq4all.txt')

disp("Save Done")



