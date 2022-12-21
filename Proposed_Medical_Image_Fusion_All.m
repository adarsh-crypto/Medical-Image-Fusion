clear all
addpath(genpath('shearlet'));
load('DMF.mat');
[ND,b]=size(DMF);
N=2;
for xi=1:ND
    P=DMF{xi,2};
    Q=DMF{xi,3};
        if size(Q,3)==3       % For MRI-SPECT Image Fusion
        tic
        P=double(P)/255;
        Q=double(Q)/255;
        Q_YUV=ConvertRGBtoYUV(Q);
        Q_Y=Q_YUV(:,:,1);
        [hei, wid]=size(P);
        F_Y=Medical_Fusion(P,Q_Y);  % Performing Image Fusion
        F_YUV=zeros(hei,wid,3);
        F_YUV(:,:,1)=F_Y;
        F_YUV(:,:,2)=Q_YUV(:,:,2);
        F_YUV(:,:,3)=Q_YUV(:,:,3);
        F=ConvertYUVtoRGB(F_YUV);
        F=uint8(F*255);
        TAD(xi)=toc;
        FMAD{xi}=F;
        figure, imshow(F)          
        else                       % For Medical Image Fusion where both the source images are gray-scale                       
        tic
        P=double(P)/255;
        Q=double(Q)/255;
        F=Medical_Fusion(P,Q);   % Performing Image Fusion
        F=uint8(F*255);
        TAD(xi)=toc;
        FMAD{xi}=F;
        figure, imshow(F) 
        end
end