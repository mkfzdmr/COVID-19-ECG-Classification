clear all
close all

%3d mapping and coordinate calculation

% Define circle parameters: Çizim ve anlamak için V'ler
radius = 5;
xCenter = 0;
yCenter = 0;
zCenter = 0;
% Make an array for all the angles:
theta_v = [4*pi/3 3*pi/2 19*pi/12 5*pi/3 11*pi/6 2*pi];% Create the x and y locations at each angle: 0 30 60 75 90 120
x_v = radius * cos(theta_v) + xCenter;
y_v = radius * sin(theta_v) + yCenter;
% Need to make a z value for every (x,y) pair:
z_v = zeros(1, numel(x_v)) + zCenter;
% Do the plot:
% First plot the center:
plot3(xCenter, yCenter, zCenter, 'r*', 'LineWidth', 2, 'MarkerSize', 15);
hold on; % Don't let circle blow away our center.
% Next plot the circle:
scatter3(x_v, y_v, z_v,'filled');
grid on;
axis('square');
xlabel('x', 'FontSize', 20);
ylabel('y', 'FontSize', 20);
zlabel('z', 'FontSize', 20);
%
hold on
%%%% For other derivation
theta = 0:pi/6:2*pi-0.1; % angle 0 to 360 degrees in radian 0 30 60 90 120 150 180...
x = radius * cos(theta) + xCenter;
y = radius * sin(theta) + yCenter;
% Need to make a z value for every (x,y) pair:
z = zeros(1, numel(x)) + zCenter;
% Do the plot:
% First plot the center:

scatter3(x_v, y_v, z_v,'filled');

hold on; % Don't let circle blow away our center.
% Next plot the circle:
scatter3(x, z, y,'filled');

%limb= y,z
%precordial=x,y
%2D=x', y'
%x_coordinates= [x x_v]; %x'=y
%y_coordinates= [y 0 0 0 0 0 0]; %y'=xcos?+zsin?
%y_deneme=x(2)* cos(theta(2))+ z(2)* sin(theta(2))





% 12lik x, z, y
% 6llik x_v, y_v, z_v
x_ler=[x x_v]; %yler
y_ler=[z y_v]; %xler ozaman
z_ler=[y z_v];
x_coordinates= [x x_v]; %x=y
y_coordinates= [y 0 0 0 0 0 0]; %y=xcos?+zsin?
%scatter(x_coordinates, y_coordinates,'filled');
%scatter3(x_ler, y_ler, z_ler,'filled');
%scatter3(y, x, z,'filled');

xx=y;
yy=x;
zz=z;
y_deneme=xx(3)* cos(theta(3))+ z(3)* sin(theta(3))
y_coordinates(3)






figure
center= zeros(18);
center= center(1,:);
initial=[center;center;center]';
terminal=[x_ler;y_ler;z_ler]';
a1=arrow3(initial,terminal,'b');
hold on
a2=arrow3(initial(13:17,:),terminal(13:17,:),'kumQuat_t');
a3=arrow3(initial(18:18,:),terminal(18:18,:),'kumQuat_t');


set(a1(strcmp(get(a1,'type'),'line')),'LineWidth',2)
set(a2(strcmp(get(a2,'type'),'line')),'LineWidth',2)
set(a3(strcmp(get(a3,'type'),'line')),'LineWidth',2)
set(a3(strcmp(get(a3,'type'),'line')),'LineStyle','--')



% Reduce arrowhead width by 25%, retain arrowhead height, and reduce
% initial point marker diameter by 50%.
arrow3('update',[1,0.5,0.5]); %arrowhed %25 kücült

x_line= [x_ler(1:12) x_ler(1)];
y_line= [y_ler(1:12) y_ler(1)];
z_line= [z_ler(1:12) z_ler(1)];

line(x_line,y_line, z_line,'Color','blue','LineStyle',':')

% x_line= [x_ler(13:end) x_ler(18)];
% y_line= [y_ler(13:end) y_ler(18)];
% z_line= [z_ler(13:end) z_ler(18)];
% 
% line(x_line,y_line, z_line)
%plot3(x_ler(1:12),y_ler(1:12),z_ler(1:12))
fName='Calisto MT';

coordinate_labels=["I-V6", "aVL" , "III(-)" ,"" ,"" ,"", "I(-)" , "aVL(-)", ...
    "III", "aVF", "II", "aVR(-)", "V1", "V2", "V3", "V4", "V5", ""];
%hold off
%delete(hText);
offset=-0.1;
hText=text(x_ler+offset,y_ler+offset,z_ler+offset,coordinate_labels,'FontSize', 16,'FontName', fName);


coordinate_labels2=["aVF(-)" ,"II(-)" ,"aVR"];

%delete(hText2)
offset=0.15;
hText2=text(x_ler(4:6)+offset,y_ler(4:6)+offset,z_ler(4:6)+offset,coordinate_labels2,'FontSize', 16,'FontName', fName);




grid on
% grid minor 
view(3)
set(gca,'CameraViewAngle',9)

ax = gca;
ax.YAxis.FontSize = 13;
ax.XAxis.FontSize = 13;
ax.ZAxis.FontSize = 13;
xlabel('y', 'FontSize', 20, 'Rotation',20);
ylabel('x', 'FontSize', 20, 'Rotation',-30);
zlabel('z', 'FontSize', 20);
set(gca,'xtick',[-5:2:5])
set(gca,'GridLineStyle','--')
set(gca,'ztick',[-5:2:5])


export_fig( "3dmapv3.png" ,'-transparent','-r500','-m2.5')%, 


