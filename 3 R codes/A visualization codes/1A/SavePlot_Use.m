

%% give and save plot

%% f1RE
mkdir('NPicsFf1RE');
fileout = ['.\NPicsFf1RE\'];


for ploti= 1:2450
    fig = figure;
    a=giveXsingleStructure(FLDf1all,ploti);
    
    imagesc(a)
    frame = getframe(fig); % 获取frame
    img = frame2im(frame); % 将frame变换成imwrite函数可以识别的格式
    %imwrite(img,'a.png');
    
    nameindex=ploti;
    name=sprintf('Nf1RE%d.jpg',nameindex);
    imwrite(img,[fileout,name]);
    %clf
    close all
end


%% 0000000000000


%% w0RE
mkdir('NPicsWw0RE');
fileout = ['.\NPicsWw0RE\'];


for ploti= 1:2450
    fig = figure;
    a=giveXsingleStructure(FLDw0all,ploti);
    
    imagesc(a)
    frame = getframe(fig); % 获取frame
    img = frame2im(frame); % 将frame变换成imwrite函数可以识别的格式
    %imwrite(img,'a.png');
    
    nameindex=ploti;
    name=sprintf('Nw0RE%d.jpg',nameindex);
    imwrite(img,[fileout,name]);
    %clf
    close all
end





%% 333333333333333


%% m3RE
mkdir('NPicsMm3RE');
fileout = ['.\NPicsMm3RE\'];


for ploti= 1:2450
    fig = figure;
    a=giveXsingleStructure(FLDm3all,ploti);
    
    imagesc(a)
    frame = getframe(fig); % 获取frame
    img = frame2im(frame); % 将frame变换成imwrite函数可以识别的格式
    %imwrite(img,'a.png');
    
    nameindex=ploti;
    name=sprintf('Nm3RE%d.jpg',nameindex);
    imwrite(img,[fileout,name]);
    %clf
    close all
end





%% 444444444444


%% q4RE
mkdir('NPicsQq4RE');
fileout = ['.\NPicsQq4RE\'];


for ploti= 1:2450
    fig = figure;
    a=giveXsingleStructure(FLDq4all,ploti);
    
    imagesc(a)
    frame = getframe(fig); % 获取frame
    img = frame2im(frame); % 将frame变换成imwrite函数可以识别的格式
    %imwrite(img,'a.png');
    
    nameindex=ploti;
    name=sprintf('Nq4RE%d.jpg',nameindex);
    imwrite(img,[fileout,name]);
    %clf
    close all
end







