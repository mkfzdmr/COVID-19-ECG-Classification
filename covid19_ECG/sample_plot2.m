clear all;
close all;
Base  = '..\covid19_ECG\ECG Images of COVID-19 Patients (250)\type_2';
List  = dir(fullfile(Base, '**', '*.jpg'));
Files = fullfile({List.folder}, {List.name}); 
iFile = 122
I = imread(Files{iFile});
imshow(I)
%v1_deneme=imcrop(I,[768.5 287.5 227 98])
    v1_deneme=imcrop(I,[155.5 675.5 221 99])                
figure
 imshow(v1_deneme)
 %imhist(v1_deneme)
          export_fig( 'III-1.png' ,'-transparent', '-r300','-m2.5')

   K = imadjust(v1_deneme,[0.1 0.7],[]);
   %imhist(K)
figure

imshow(K)          
export_fig( 'III-2.png' ,'-transparent', '-r300','-m2.5')

        % arkaplan kaldýrma
        figure
        binaryImage = K(:, :, 2) < 250; % Or whatever threshold works.
        imshow(1-binaryImage)
        export_fig( 'III-3.png' ,'-transparent', '-r300','-m2.5')

        binaryImage = bwareafilt(binaryImage, 1); % Extract only the largest blob.
        figure
        imshow(1-binaryImage)
                export_fig( 'III-4.png' ,'-transparent', '-r300','-m2.5')

        % figure, imshow(1-binaryImage)
         export_fig( 'III.png' ,'-transparent', '-r300','-m2.5')
%         %