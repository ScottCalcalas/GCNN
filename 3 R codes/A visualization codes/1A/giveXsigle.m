function nowUse= giveXsigle(useData,nowNumi)
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
end