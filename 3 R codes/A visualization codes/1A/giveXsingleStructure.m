function newUse = giveXsingleStructure(useData,nowNumi)

nowData=useData;
startCol=3;
enCol=18;
%dataSize=size(nowData);
%numi=dataSize(1)/8;

%i=1:3%numi
i=nowNumi;
startRow=(i-1)*8+1;
enRow=i*8;
nowUse=nowData(startRow:enRow,startCol:enCol);
%%
%newUse
for i=1:16
    f{i}=[nowUse(1,i),nowUse(2,i),nowUse(3,i),nowUse(4,i)
        nowUse(5,i),nowUse(6,i),nowUse(7,i),nowUse(8,i)];
    
end


aa=zeros(2,1);

newUse=[aa,f{1},f{2},f{3},f{4}
        aa,f{5},f{6},f{7},f{8}
        aa,f{9},f{10},f{11},f{12}
        aa,f{13},f{14},f{15},f{16}];

end