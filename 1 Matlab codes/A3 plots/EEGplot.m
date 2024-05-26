%plot the data for paper

Nowdata=f102;


%%
for Channeli=1:8

    subplot(8,1,Channeli);
    PlotData=Nowdata(Channeli,:);
    plot(PlotData)
end
