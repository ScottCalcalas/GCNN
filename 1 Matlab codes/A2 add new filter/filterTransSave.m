%2022 10 7
%scott
%use function one by one:

nowDo=Dm3all;%change here name
rowSize=length(nowDo(:,1));
processData=zeros(rowSize,length(nowDo(1,:)));
for i=1:rowSize
    % HERE is from DSM
    fc=1024;
    N=600;
    n=0:N-1;
    f=n*fc/N;
    Wn=[200*2 500*2]/fc;

    [k,l]=butter(2,Wn);
    result=filtfilt(k,l,nowDo(i,:));
    tmp=fft(result);
    fp=ifft(tmp);
    % DSM code END

    processData(i,:)=fp;

    fprintf("%d row finished\n",i);
end

save LDm3all.txt processData -ascii %change here name

fprintf("Save finished\n\n");













