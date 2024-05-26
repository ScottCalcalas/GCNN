function Gf101s = REstructure(Gf101)

Gf101s=zeros(length(Gf101),17);
for i=1:length(Gf101)/8
    Gf101s((i-1)*8+1:i*8,:)=giveXsingleStructure(Gf101,i);
end

end