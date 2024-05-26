%2022 10 7
%scott

%%
%test

%A=[1 2 3 0
%    4 5 6 0
%    7 8 9 0];

%%
%read the data


%use function one by one:

nowDo=w001;%change here name
rowSize=length(nowDo(:,1));
processData=zeros(rowSize,length(nowDo(1,:)));
for i=1:rowSize
    processData(i,:)=filter(filterFunc,nowDo(i,:));
    fprintf("%d row finished\n",i);
end

save Lw001.txt processData -ascii %change here name

fprintf("Save finished\n\n");













