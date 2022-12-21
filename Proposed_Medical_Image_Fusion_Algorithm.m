

 clear all
 P=imread('MRI.png');  % A MxN matrix
 Q=imread('SPECT.png');  % A MxNx3 matrix

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
        toc
        figure, imshow(F)          
  else                       % For Medical Image Fusion where both the source images are gray-scale                       
        tic
        P=double(P)/255;
        Q=double(Q)/255;
        F=Medical_Fusion(P,Q);   % Performing Image Fusion
        F=uint8(F*255);
        toc
        figure, imshow(F) 
  end
       
   

         

