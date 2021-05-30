clear all;
close all;
load('coordinates.mat');
% load('normal_statistical_total.mat')
% load('covid_statistical_total.mat')
load('positive_energies_normalized.mat')
load('negative_energies_normalized.mat')


% covid_energies= covid_statistical_total(:,1);
% normal_energies=normal_statistical_total(1:4500,1);
% 
% %normalize
% energies=[covid_energies; normal_energies];
% % c=rescale(covid_energies, 0, 1);
% % n=rescale(normal_energies, 0, 1);
% normalize_energies=rescale(energies, 0, 1);
% covid_energies=normalize_energies(1:4500);
% normal_energies=normalize_energies(4501:end);

%[h,p] = ttest(covid_energies(1:18,1),normal_energies(1:18,1))
%p =2.3590e-08

%positive covid-19
%negative: normal(83) +abnormal (83) +mi (84)


xi=linspace(min(x_coordinates),max(x_coordinates),100);
yi=linspace(min(y_coordinates),max(y_coordinates),100);
[XI YI]=meshgrid(xi,yi);
figure, set(gcf,'visible','off');
%covid patient

for iFile = 1:250
    
    
    ZI = griddata(x_coordinates,y_coordinates,positive_energies(1+(18*(iFile-1)):18+(18*(iFile-1)))',XI,YI,'natural');
    
    contourf(XI,YI,ZI,50,'edgecolor','none');
    colormap(jet);
    axis off
    set(gcf,'position',[-15,15,710,720])
    set(gca,'LooseInset',get(gca,'TightInset'))
    caxis([0 1])

    %save features map
    kayit_yeri=strcat( '..\covid19_ECG\feature_maps\positive\'...
        ,num2str(iFile));
    kayit_yeri=strcat(kayit_yeri,'.png');
    export_fig( kayit_yeri ,'-transparent')%, '-r300'
    %-m2.5
    
    
end


figure, set(gcf,'visible','off');
%normal people
for iFile = 1:250
    
    
    ZI = griddata(x_coordinates,y_coordinates,negative_energies(1+(18*(iFile-1)):18+(18*(iFile-1)))',XI,YI,'natural');
    
    contourf(XI,YI,ZI,50,'edgecolor','none');
    colormap(jet);
    axis off
    set(gcf,'position',[-15,15,710,720])
    set(gca,'LooseInset',get(gca,'TightInset'))
    caxis([0 1])

    %save features map
    kayit_yeri=strcat( '..\covid19_ECG\feature_maps\negative\'...
        ,num2str(iFile));
    kayit_yeri=strcat(kayit_yeri,'.png');
    export_fig( kayit_yeri ,'-transparent')%, '-r300'
    %-m2.5
    
    
end

% (sum(normal_energies))/250
% (sum(covid_energies))/250

% normalize_energies= [normalize_energies(1:4500) normalize_energies(4501:end)]

% t=normc(energies);