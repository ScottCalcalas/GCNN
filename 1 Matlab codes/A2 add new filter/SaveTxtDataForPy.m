


%%
%train:13800
%1725 second for train

TrainGf1=FLDf1all(1:13800,:);
TrainGw0=FLDw0all(1:13800,:);
TrainGm3=FLDm3all(1:13800,:);
TrainGq4=FLDq4all(1:13800,:);

%test:5800
%725 second for test
TestGf1=FLDf1all(13801:19600,:);
TestGw0=FLDw0all(13801:19600,:);
TestGm3=FLDm3all(13801:19600,:);
TestGq4=FLDq4all(13801:19600,:);

%%
writematrix(TrainGf1,'MTrainGf1.txt')
writematrix(TrainGw0,'MTrainGw0.txt')
writematrix(TrainGm3,'MTrainGm3.txt')
writematrix(TrainGq4,'MTrainGq4.txt')

writematrix(TestGf1,'MTestGf1.txt')
writematrix(TestGw0,'MTestGw0.txt')
writematrix(TestGm3,'MTestGm3.txt')
writematrix(TestGq4,'MTestGq4.txt')
















