clear all
close all


%%2d Mapping
% I II II avl avf avr ve eksili deðerleri için
theta = 0:pi/6:2*pi-0.1; % angle 0 to 360 degrees in radian 0 30 60 90 120 150 180...
radius = 5;          % radius
x = radius*cos(theta);    % cartesian x coordinate
y = radius*sin(theta);    % cartesian y coordinate

%V1 V2 V3 V4 V5 V6 için
theta_v = [4*pi/3 3*pi/2 19*pi/12 5*pi/3 11*pi/6 2*pi];% Create the x and y locations at each angle: 0 30 60 75 90 120
x_v = radius*cos(theta_v);    % cartesian x coordinate
y_v = radius*sin(theta_v);    % cartesian y coordinate
coordinate_labels=["I", "aVL" , "III(-)" ,"aVF(-)" ,"II(-)" ,"aVR", "I(-)" , "aVL(-)", ...
    "III", "aVF", "II", "aVR(-)", "V1", "V2", "V3", "V4", "V5", "V6"];

angle_labels=["0" ,"-30" ,"-60"  ,"-90"  ,"-120" ,"-150" ,"+180" ,"+150"  ,"+120" ,"+90"  ...
    ,"+60"  ,"+30" ,"+120" ,"+90" ,"+75","+60" ,"+30" ,"0"];
for i=1:18
    angle_labels(i)=strcat(convertStringsToChars(angle_labels(i)),['' char(176)'']);
end


x_coordinates= [x x_v]; %x=y
y_coordinates= [y 0 0 0 0 0 0]; %y=xcos?+zsin?
%scatter(x_coordinates, y_coordinates,'filled');
%y_deneme=y(2)* cos(theta(2))+ z(2)* sin(theta(2))



figure
fSize=16
fName='Calisto MT';
lw=0.5;
sz = 75;
offset=0.2;
offset_angle_x=offset;
offset_angle_y=-offset;

s=scatter(x_coordinates(2:12),y_coordinates(2:12),sz,'filled');
text(x_coordinates(2:12)+offset,y_coordinates(2:12)+offset,coordinate_labels(2:12), 'FontSize', fSize,'FontName', fName)
text(x_coordinates(2:12)+offset_angle_x,y_coordinates(2:12)+offset_angle_y,angle_labels(2:12), 'FontSize', fSize-2,'FontName', fName)

hold on
s.MarkerEdgeColor = '#0072BD';
s.MarkerFaceColor = '#2D7FED';
s.LineWidth=lw;

s=scatter(x_coordinates(13:16),y_coordinates(13:16),sz,'filled');
text(x_coordinates(13:16)+offset,y_coordinates(13:16)+offset,coordinate_labels(13:16), 'FontSize', fSize,'FontName', fName)
text(x_coordinates(13:16)+offset_angle_x,y_coordinates(13:16)+offset_angle_y,angle_labels(13:16), 'FontSize', fSize-2,'FontName', fName)

s.MarkerEdgeColor = '#A2142F';
s.MarkerFaceColor = '#D95319';
s.LineWidth=lw;
s=scatter(x_coordinates(17:17),y_coordinates(17:17),sz,'filled');
text(x_coordinates(17:17)+offset-0.8,y_coordinates(17:17)+offset,coordinate_labels(17:17), 'FontSize', fSize,'FontName', fName)
text(x_coordinates(17:17)+offset_angle_x-0.95,y_coordinates(17:17)+offset_angle_y,angle_labels(17:17), 'FontSize', fSize-2,'FontName', fName)
s.MarkerEdgeColor = '#A2142F';
s.MarkerFaceColor = '#D95319';
s.LineWidth=lw;


s=scatter(x_coordinates(18:18),y_coordinates(18:18),sz,'filled');
text(x_coordinates(18:18)+offset-0.4,y_coordinates(18:18)+offset+0.15,'I-V6', 'FontSize', fSize,'FontName', fName)
text(x_coordinates(18:18)+offset_angle_x-0.1,y_coordinates(18:18)+offset_angle_y,angle_labels(18), 'FontSize', fSize-2,'FontName', fName)


s.MarkerEdgeColor = '#0072BD';
s.MarkerFaceColor = '#D95319';
s.LineWidth=lw+1;

xlim([-5.3 5.6])
ylim([-5.4 5.3])
grid minor
hold off
%axis('square');

ax = gca;
ax.YAxis.FontSize = 13;
ax.XAxis.FontSize = 13;
set(ax,'LineWidth',1);
xlabel('y', 'FontSize', 20);
ylabel('z', 'FontSize', 20);

grid off
export_fig( "2dmapv3.png" ,'-transparent','-r500','-m2.5')%, 





%%%%%%%%% end of 2d mapping
