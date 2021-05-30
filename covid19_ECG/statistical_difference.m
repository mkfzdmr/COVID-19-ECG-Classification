clear all;
close all;
% covid_statistical_total=[];
% load('covid_statistical_type1.mat')
% covid_statistical_total= [covid_statistical_total; covid_statistical ];
% load('covid_statistical_type2.mat')
% covid_statistical_total= [covid_statistical_total; covid_statistical ];
% load('covid_statistical_type3.mat')
% covid_statistical_total= [covid_statistical_total; covid_statistical ];

% load('normal_statistical_total.mat')
% normal_statistical_total=covid_statistical;
statistical_label= ["Energy","Correlation","Contrast","Homogeneity"] ;



load('normal_statistical_total.mat')
load('covid_statistical_total.mat')
load('mi_statistical_total.mat')
load('abnormal_statistical_total.mat')


%%for covid 
%250 patients x 18 channel =4500 total 
%for normal 
%250 patients x 18 channel =4500 total 
%Energy t-test results

%Energy
[h,p] = ttest(normal_statistical_total(1:18,1),covid_statistical_total(1:18,1))
%p = 4.6364e-298


%Correlation
[h,p] = ttest(normal_statistical_total(1:4500,2),covid_statistical_total(:,2))


%p = 0

%Contrast
[h,p] = ttest(normal_statistical_total(1:4500,3),covid_statistical_total(:,3))
%p = 0



%Homogeneity
[h,p] = ttest(normal_statistical_total(1:4500,4),covid_statistical_total(:,4))

%p =  0


%% anova for normal kendi arasýnda
[p,tbl,stats] = anova1(normal_statistical_total(1:4500,:),statistical_label)
[c,~,~,gnames] = multcompare(stats);



%% anova for normal kendi arasýnda
[p,tbl,stats] = anova1(covid_statistical_total(1:4500,:),statistical_label)
[c,~,~,gnames] = multcompare(stats);




statistical_label= ["Energy","Correlation","Contrast","Homogeneity"] ;
%% anova for Energy
[p,tbl,stats] = anova1([normal_statistical_total(1:18,1) covid_statistical_total(1:18,1)],...
    ["NoFindings_Energy","Covid_Energy"])
[c,~,~,gnames] = multcompare(stats);
title('Anova energy','fontweight','bold','fontsize',16);
xlabel('GLCM Energies','fontweight','bold','fontsize',14);
ylabel('Energy Values','fontweight','bold','fontsize',14);
export_fig( "anovaEnergy.png" ,'-transparent''-r500','-m2.5')%, 

%% anova for Correlation
[p,tbl,stats] = anova1([normal_statistical_total(1:4500,2) covid_statistical_total(1:4500,2)],...
    ["Normal_Correlation","Covid_Correlation"])
[c,~,~,gnames] = multcompare(stats);
%% anova for Contrast
[p,tbl,stats] = anova1([normal_statistical_total(1:4500,3) covid_statistical_total(1:4500,3)],...
    ["Normal_Contrast","Covid_Contrast"])
[c,~,~,gnames] = multcompare(stats);
%% anova for Homogeneity
[p,tbl,stats] = anova1([normal_statistical_total(1:4500,4) covid_statistical_total(1:4500,4)],...
    ["Normal_Homogeneity","Covid_Homogeneity"])
[c,~,~,gnames] = multcompare(stats);







%together

total_data= [covid_statistical_total(1:4500,:) normal_statistical_total(1:4500,:)];
statistical_label_multi= ["C_Energy","C_Correlation","C_Contrast","C_Homogeneity",...
    "N_Energy","N_Correlation","N_Contrast","N_Homogeneity"] ;



% [p,tbl,stats] = anova1(total_data,statistical_label_multi)
% [c,m,h,nms] = multcompare(stats);



[p,tbl,stats] = anova2(covid_statistical_total(1:4500,:),250,statistical_label);
c = multcompare(stats)




%%%%%%%%%%%%%% NoFindings (Normal) vs Covid-19 (Covid-19)

covid_energies= covid_statistical_total(:,1);
normal_energies=normal_statistical_total(1:4500,1);

%normalize
energies=[covid_energies; normal_energies];
% c=rescale(covid_energies, 0, 1);
% n=rescale(normal_energies, 0, 1);
normalize_energies=rescale(energies, 0, 1);
covid_energies=normalize_energies(1:4500);
normal_energies=normalize_energies(4501:end);



%% anova for Energy
[p,tbl,stats] = anova1([normal_energies(1:end,1) covid_energies(1:end,1)],...
    ["NoFindings_Energy","Covid_Energy"])
[c,~,~,gnames] = multcompare(stats);
title('Anova energy','fontweight','bold','fontsize',16);
xlabel('GLCM Energies','fontweight','bold','fontsize',14);
ylabel('Energy Values','fontweight','bold','fontsize',14);
export_fig( "anovaEnergy.png" ,'-transparent''-r500','-m2.5')%, 





%%%%%%%%%%%%%% Negatives (Normal + Abnormal + MI) vs Positive (Covid-19)
statistical_label= ["Energy","Correlation","Contrast","Homogeneity"] ;

positive_energies=covid_statistical_total(:,1);
%every group has ~83 patients in negatives
negative_energies= [normal_statistical_total(1:83*18,1) ; abnormal_statistical(1:83*18,1) ;...
    mi_statistical(1:84*18,1)];



%normalize
energies=[positive_energies; negative_energies];
% c=rescale(covid_energies, 0, 1);
% n=rescale(normal_energies, 0, 1);
normalize_energies=rescale(energies, 0, 1);
positive_energies=normalize_energies(1:4500);
negative_energies=normalize_energies(4501:end);



[p,tbl,stats] = anova1([negative_energies(1:end,1) positive_energies(1:end,1)],...
    ["Negative_Energy","Positive_Energy"])
[c,~,~,gnames] = multcompare(stats);
title('Anova energy','fontweight','bold','fontsize',16);
xlabel('GLCM Energies','fontweight','bold','fontsize',16);
ylabel('Normalized Energy Values','fontweight','bold','fontsize',16);
export_fig( "anovaEnergymultÝ.png" ,'-transparent','-r500','-m2.5')%, 



%%%%% multi compare postive vs negative

covid_energies= covid_statistical_total(1:83*18,1);
normal_energies=normal_statistical_total(1:83*18,1);
abnormal_energies=abnormal_statistical(1:83*18,1) ;
mi_energies= mi_statistical(1:83*18,1);

%normalize
energies=[covid_energies; normal_energies;abnormal_energies;mi_energies];
% c=rescale(covid_energies, 0, 1);
% n=rescale(normal_energies, 0, 1);
normalize_energies=rescale(energies, 0, 1);
covid_energies=normalize_energies(1:1494);
normal_energies=normalize_energies(1495:1494+1494);
abnormal_energies=normalize_energies(1494+1495:1494+1494+1494);
mi_energies=normalize_energies(1495+1494+1494:end);



[p,tbl,stats] = anova1([covid_energies normal_energies abnormal_energies mi_energies],...
    ["Covid-19","Normal","Abnormal","MI"])
[c,~,~,gnames] = multcompare(stats);

%for all p
[h,p] = ttest(covid_energies,normal_energies)
%p =  1.3878e-279


[h,p] = ttest(covid_energies,abnormal_energies)
%p  7.8362e-117

[h,p] = ttest(covid_energies,mi_energies)
%   1.7270e-160


%%%%multi compare nofindings vs covid features
statistical_label= ["Energy","Correlation","Contrast","Homogeneity"] ;

covid_energies= covid_statistical_total(:,1);
normal_energies=normal_statistical_total(1:4500,1);
%normalize
energies=[covid_energies; normal_energies];
% c=rescale(covid_energies, 0, 1);
% n=rescale(normal_energies, 0, 1);
normalize_energies=rescale(energies, 0, 1);
covid_energies=normalize_energies(1:4500);
normal_energies=normalize_energies(4501:end);



covid_Correlation= covid_statistical_total(:,2);
normal_Correlation=normal_statistical_total(1:4500,2);
%normalize
energies=[covid_Correlation; normal_Correlation];
% c=rescale(covid_energies, 0, 1);
% n=rescale(normal_energies, 0, 1);
normalize_energies=rescale(energies, 0, 1);
covid_Correlation=normalize_energies(1:4500);
normal_Correlation=normalize_energies(4501:end);


covid_Contrast= covid_statistical_total(:,3);
normal_Contrast=normal_statistical_total(1:4500,3);
%normalize
energies=[covid_Contrast; normal_Contrast];
% c=rescale(covid_energies, 0, 1);
% n=rescale(normal_energies, 0, 1);
normalize_energies=rescale(energies, 0, 1);
covid_Contrast=normalize_energies(1:4500);
normal_Contrast=normalize_energies(4501:end);




covid_Homogeneity= covid_statistical_total(:,4);
normal_Homogeneity=normal_statistical_total(1:4500,4);
%normalize
energies=[covid_Homogeneity; normal_Homogeneity];
% c=rescale(covid_energies, 0, 1);
% n=rescale(normal_energies, 0, 1);
normalize_energies=rescale(energies, 0, 1);
covid_Homogeneity=normalize_energies(1:4500);
normal_Homogeneity=normalize_energies(4501:end);


multi=[covid_energies normal_energies covid_Correlation normal_Correlation covid_Contrast normal_Contrast covid_Homogeneity normal_Homogeneity];
%multi_label= ["Energy(C)","Energy(N)","Correlation(C)","Correlation(N)","Contrast(C)","Contrast(N)","Homogeneity(C)","Homogeneity(N)"] ;
multi_label= ["(C)","(N)","(C)","(N)","(C)","(N)","(C)","(N)",] ;


[p,tbl,stats] = anova1(multi)   


%title('Anova energy','fontweight','bold','fontsize',16);
xlabel('GLCM Features','fontweight','bold','fontsize',18);
ylabel('Normalized Values','fontweight','bold','fontsize',18);
ax = gca;
ax.YAxis.FontSize = 14
ax.XAxis.FontSize = 14
set(ax,'LineWidth',1);
xticklabels(multi_label);
export_fig( "anovamulti.png" ,'-transparent','-r500','-m2.5')%, 



%Energy
[h,p] = ttest(covid_energies,normal_energies)
%p = 4.6364e-298


%Correlation
[h,p] = ttest(covid_Correlation,normal_Correlation)


%p = 0

%Contrast
[h,p] = ttest(covid_Contrast,normal_Contrast)
%p = 0



%Homogeneity
[h,p] = ttest(covid_Homogeneity,normal_Homogeneity)

%p =  0

