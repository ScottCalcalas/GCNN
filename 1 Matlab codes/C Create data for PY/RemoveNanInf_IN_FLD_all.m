
Nowdata=FLDw0all;

Nowdata(isnan(Nowdata)) = 0;

data11=isinf(Nowdata);
[inf_r, inf_c]=find(data11==1);
FLDw0all(inf_r,inf_c)=0;


%%

Nowdata=FLDf1all;

Nowdata(isnan(Nowdata)) = 0;

data11=isinf(Nowdata);
[inf_r, inf_c]=find(data11==1);
FLDf1all(inf_r,inf_c)=0;

%%

Nowdata=FLDm3all;

Nowdata(isnan(Nowdata)) = 0;

data11=isinf(Nowdata);
[inf_r, inf_c]=find(data11==1);
FLDm3all(inf_r,inf_c)=0;


%%

Nowdata=FLDq4all;

Nowdata(isnan(Nowdata)) = 0;

data11=isinf(Nowdata);
[inf_r, inf_c]=find(data11==1);
FLDq4all(inf_r,inf_c)=0;









