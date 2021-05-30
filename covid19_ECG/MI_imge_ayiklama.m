clear all;
close all;
Base  = '..\covid19_ECG\ECG Images of Patient that have History of MI (203)';
List  = dir(fullfile(Base, '**', '*.jpg'));
Files = fullfile({List.folder}, {List.name});
% load('coordinates.mat');
mi_statistical=[];
%iFile = 1

% figure, set(gcf,'visible','off');
for iFile = 1:numel(Files)
    
    I = imread(Files{iFile});
    %imshow(I)
    %kýrpma
    
    % [J,rect] = imcrop(I); %koordinatlarý bulmak icin
    %[103.5 104.5 723 432] tüm ecg
    I2 = imcrop(I,[71.5 287.5 2102 1228]);  
    % imshow(I2)
    %%%%[J,rect] = imcrop(I2); %koordinatlarý bulmak icin
    %I3 = imcrop(I2,[40.5 4.5 152 90]); % bir kanal
    % imshow(I_image)
    
    I_image= imcrop(I2,[120.5 0.5 315 315]);
    aVR_image= imcrop(I2,[672.5 0.5 315 315]); 
    V1_image=imcrop(I2,[1133.5 0.5 315 315]); 
    V4_image= imcrop(I2,[1639.5 0.5 315 315]); 
    II_image= imcrop(I2,[120.5  315.5 315 315]); 
    aVL_image= imcrop(I2,[672.5 315.5 315 315]);
    V2_image=imcrop(I2,[1133.5 315.5 315 315]);
    V5_image= imcrop(I2,[1639.5 315.5 315 315]);
    III_image= imcrop(I2,[120.5 630.5 315 315]);
    aVF_image= imcrop(I2,[672.5 630.5 315 315]);
    V3_image=imcrop(I2,[1133.5 630.5 315 315]);
    V6_image= imcrop(I2,[1639.5 630.5 315 315]);
    
    % -li sinyal oluþturma
    I_image_neg=I_image(end:-1:1,:,:); %figure, imshow(I_image_neg)
    aVR_image_neg=aVR_image(end:-1:1,:,:);
    II_image_neg=II_image(end:-1:1,:,:);
    aVL_image_neg=aVL_image(end:-1:1,:,:);
    III_image_neg=III_image(end:-1:1,:,:);
    aVF_image_neg=aVF_image(end:-1:1,:,:);
    
    all_cropped_image=cat(4, I_image, aVL_image, III_image_neg, aVF_image_neg, ...
        II_image_neg, aVR_image, I_image_neg, aVL_image_neg, III_image, aVF_image,...
        II_image, aVR_image_neg, V1_image, V2_image, V3_image, V4_image, V5_image, V6_image );
    %size(all_cropped_image)
    % figure, imshow(all_cropped_image(:,:,:,5));
    
    
    % coordinate_labels=["I", "aVL" , "III(-)" ,"aVF(-)" ,"II(-)" ,"aVR", "I(-)" , "aVL(-)", ...
    %"III", "aVF", "II", "aVR(-)", "V1", "V2", "V3", "V4", "V5", "V6"];
    
    
    %adjust
    for i=1:18
        
        K = imadjust(all_cropped_image(:,:,:,i),[0.1 0.7],[]);
        % figure
        % imshow(K)
        % arkaplan kaldýrma
        
        binaryImage = K(:, :, 2) < 250; % Or whatever threshold works.
        binaryImage = bwareafilt(binaryImage, 1); % Extract only the largest blob.
        % figure, imshow(1-binaryImage)
        all_cropped_image_binary(:,:,i)=(binaryImage);
        
%         
%         %figure, imshow (all_cropped_image_binary(:,:,5))
%         switch (i)
%             case 1
%                 channel='\I\';
%             case 11
%                 channel='\II\';
%             case 9
%                 channel='\III\';
%             case 6
%                 channel='\aVR\';
%             case 2
%                 channel='\avL\';
%             case 10
%                 channel='\avF\';
%             case 13
%                 channel='\V1\';
%             case 14
%                 channel='\V2\';
%             case 15
%                 channel='\V3\';
%             case 16
%                 channel='\V4\';
%             case 17
%                 channel='\V5\';
%             case 18
%                 channel='\V6\';
%             case 7
%                 channel='\I(-)\';
%             case 5
%                 channel='\II(-)\';
%             case 3
%                 channel='\III(-)\';
%             case 12
%                 channel='\aVR(-)\';
%             case 8
%                 channel='\avL(-)\';
%             case 4
%                 channel='\avF(-)\';
%                 
%         end
%         
%         % coordinate_labels=["I", "aVL" , "III(-)" ,"aVF(-)" ,"II(-)" ,"aVR", "I(-)" , "aVL(-)", ...
%         %"III", "aVF", "II", "aVR(-)", "V1", "V2", "V3", "V4", "V5", "V6"];
%         
%         %%save ECG images
%         kayit_yeri=strcat( '..\covid19_ECG\preprocessed_dataset\normal'...
%             ,channel);
%         kayit_yeri=strcat(kayit_yeri,num2str(iFile));
%         kayit_yeri=strcat(kayit_yeri,'.png');
%         imshow (1-all_cropped_image_binary(:,:,i))
%         export_fig( kayit_yeri ,'-transparent', '-r300')
%         %-m2.5
%         
%         
    end % 12 channel
    
    
    % %comatrix
    % comat=[];
    % for k=1:18
    %     comat= [comat graycomatrix(logical(all_cropped_image_binary(:,:,k)))];
    %
    % end
    
    
    
    %asýl feature cikarma burasi, eskiden matrix alýyorduk þimdi burada herþeyi
    %düzgünce hesaplýyoruz
    comat_energy=[];
%     comat_correlation=[];
%     comat_contrast=[];
%     comat_homogeneity=[];
%     
    for k=1:18
        glcms=graycomatrix(logical(all_cropped_image_binary(:,:,k)));
        stats = graycoprops(glcms);% Calculate properties of gray-level co-occurrence matrix
        
        comat_energy= [comat_energy stats.Energy];
%         comat_correlation= [comat_correlation stats.Correlation];       
%         comat_contrast= [comat_contrast stats.Contrast];
%         comat_homogeneity= [comat_homogeneity stats.Homogeneity];
%         
    end %feature exraction
    
    
    %statistical difference
    mi_statistical= [mi_statistical; comat_energy'];
 %  statistical_label= ["Energy","Correlation","Contrast","Homogeneity"] ;
    
    
    %loksayona göre haritalama
    
    
    
    % x_coordinates = [2.5; 1.5; 3; 2; 1; 2; 3; 5; 6; 7; 6; 5; 6.5; 5.5];
    % y_coordinates = [7; 5.7; 5.8; 5; 4; 2; 1; 1; 2; 4; 5; 5.8; 6; 7];
%     xi=linspace(min(x_coordinates),max(x_coordinates),100);
%     yi=linspace(min(y_coordinates),max(y_coordinates),100);
%     [XI YI]=meshgrid(xi,yi);
%     ZI = griddata(x_coordinates,y_coordinates,comat_energy(1,1:end)',XI,YI,'natural');
%     
%     figure, set(gcf,'visible','off');
%     contourf(XI,YI,ZI,50,'edgecolor','none');
%    % colormap(hsv);
%     axis off
%     set(gcf,'position',[-15,15,710,720])
%     set(gca,'LooseInset',get(gca,'TightInset'))

        
%     %save features map
%     kayit_yeri=strcat( '..\covid19_ECG\feature_maps\normal\'...
%         ,num2str(iFile));
%     kayit_yeri=strcat(kayit_yeri,'.png');
%     export_fig( kayit_yeri ,'-transparent')
%     %-m2.5
    
    
    
end% dosya









