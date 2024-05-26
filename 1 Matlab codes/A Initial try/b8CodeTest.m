



%%
X1=(Lw001)';
M1=corr(X1)


X2=(Lw002)';
M2=corr(X2)


X3=(Lw003)';
M3=corr(X3)


X4=(Lw004)';
M4=corr(X4)
%%
X5=(Lf101)';
M5=corr(X5)


X6=(Lf102)';
M6=corr(X6)


X7=(Lf103)';
M7=corr(X7)


X8=(Lf104)';
M8=corr(X8)


%%
M=M1+M2+M3+M4+M5+M6+M7+M8

OutM=M/8

%%

OutM(OutM<0)=0;

%%
save CorrM.txt OutM -ascii




