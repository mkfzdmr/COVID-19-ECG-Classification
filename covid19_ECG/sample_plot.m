clear all;
close all;
load('coordinates.mat');
load('normal_statistical_total.mat')
load('covid_statistical_total.mat')

covid_energies= covid_statistical_total(:,1);
normal_energies=normal_statistical_total(1:4500,1);

%normalize
energies=[covid_energies; normal_energies];
% c=rescale(covid_energies, 0, 1);
% n=rescale(normal_energies, 0, 1);
normalize_energies=rescale(energies, 0, 1);
covid_energies=normalize_energies(1:4500);
normal_energies=normalize_energies(4501:end);

%[h,p] = ttest(covid_energies(1:18,1),normal_energies(1:18,1))
%p =2.3590e-08


xi=linspace(min(x_coordinates),max(x_coordinates),100);
yi=linspace(min(y_coordinates),max(y_coordinates),100);
[XI YI]=meshgrid(xi,yi);
figure %, set(gcf,'visible','off');
%covid patient




coordinate_labels=["I", "aVL" , "III(-)" ,"aVF(-)" ,"II(-)" ,"aVR", "I(-)" , "aVL(-)", ...
    "III", "aVF", "II", "aVR(-)", "V1", "V2", "V3", "V4", "V5", "V6"];
fSize=10;
fName='Calisto MT';


%%2d Mapping
% I II II avl avf avr ve eksili deðerleri için
theta = 0:pi/6:2*pi-0.1; % angle 0 to 360 degrees in radian 0 30 60 90 120 150 180...
radius = 5;          % radius
x = radius*cos(theta);    % cartesian x coordinate
y = radius*sin(theta);    % cartesian y coordinate

%V1 V2 V3 V4 V5 V6 için
theta = [4*pi/3 3*pi/2 19*pi/12 5*pi/3 11*pi/6 2*pi];% Create the x and y locations at each angle: 0 30 60 75 90 120
x_v = radius*cos(theta);    % cartesian x coordinate
y_v = radius*sin(theta);    % cartesian y coordinate
x_coordinates= [x x_v];
y_coordinates= [y 0 0 0 0 0 0];
lw=0.5;
sz = 10;
offset=0.2;






 iFile = 16  %normal 211 covid 7
    
    
    ZI = griddata(x_coordinates,y_coordinates,covid_energies(1+(18*(iFile-1)):18+(18*(iFile-1)))',XI,YI,'natural');
    
    contourf(XI,YI,ZI,50,'edgecolor','none');
    colormap(jet);
    %axis off
%     set(gcf,'position',[-15,15,710,720])
%     set(gca,'LooseInset',get(gca,'TightInset'))
   % 
   ch=colorbar;
   ylabel(ch, 'Energy', 'FontSize', 20)
   caxis([0 1])
    hold on
    s=scatter(x_coordinates(2:12),y_coordinates(2:12),sz,'filled');
text(x_coordinates(2:12)+offset,y_coordinates(2:12)+offset,coordinate_labels(2:12), 'FontSize', fSize,'FontName', fName,'fontweight','bold')


s.MarkerEdgeColor = '#0072BD';
s.MarkerFaceColor = '#2D7FED';
s.LineWidth=lw;

s=scatter(x_coordinates(13:16),y_coordinates(13:16),sz,'filled');
text(x_coordinates(13:16)+offset,y_coordinates(13:16)+offset,coordinate_labels(13:16), 'FontSize', fSize,'FontName', fName,'fontweight','bold')

s.MarkerEdgeColor = '#A2142F';
s.MarkerFaceColor = '#D95319';
s.LineWidth=lw;
s=scatter(x_coordinates(17:17),y_coordinates(17:17),sz,'filled');
text(x_coordinates(17:17)+offset-0.8,y_coordinates(17:17)+offset,coordinate_labels(17:17), 'FontSize', fSize,'FontName', fName,'fontweight','bold')
s.MarkerEdgeColor = '#A2142F';
s.MarkerFaceColor = '#D95319';
s.LineWidth=lw;


s=scatter(x_coordinates(18:18),y_coordinates(18:18),sz,'filled');
text(x_coordinates(18:18)+offset-0.4,y_coordinates(18:18)+offset+0.15,'I-V6', 'FontSize', fSize,'FontName', fName,'fontweight','bold')


s.MarkerEdgeColor = '#0072BD';
s.MarkerFaceColor = '#D95319';
s.LineWidth=lw+1;

xlim([-5.3 5.7])
ylim([-5.4 5.6])

    
  ax = gca;
ax.YAxis.FontSize = 13;
ax.XAxis.FontSize = 13;
set(ax,'LineWidth',1);
xlabel('y', 'FontSize', 16);
ylabel('z', 'FontSize', 16);  
    ch.FontSize=11;
   
    
    
    %save features map
    kayit_yeri=strcat( 'covid'...
        ,num2str(iFile));
    kayit_yeri=strcat(kayit_yeri,'.png');
export_fig( kayit_yeri ,'-transparent','-r300','-m2.5')%, 
    %
    
    


% 
% figure, set(gcf,'visible','off');
% %normal people
%  iFile = 211
%     
%     
%     ZI = griddata(x_coordinates,y_coordinates,normal_energies(1+(18*(iFile-1)):18+(18*(iFile-1)))',XI,YI,'natural');
%     
%     contourf(XI,YI,ZI,50,'edgecolor','none');
%     colormap(jet);
%     axis off
%     set(gcf,'position',[-15,15,710,720])
%     set(gca,'LooseInset',get(gca,'TightInset'))
%     caxis([0 1])
% 
%     %save features map
%     kayit_yeri=strcat( '..\Covid19\sonuçlar ve çizimler\'...
%         ,num2str(iFile));
%     kayit_yeri=strcat(kayit_yeri,'.png');
%     export_fig( kayit_yeri ,'-transparent')%, '-r300'
%     %-m2.5
%     
%     
%
% 
% % (sum(normal_energies))/250
% % (sum(covid_energies))/250
% 
% % normalize_energies= [normalize_energies(1:4500) normalize_energies(4501:end)]
% 
% % t=normc(energies);