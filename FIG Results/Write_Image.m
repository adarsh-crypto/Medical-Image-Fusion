load('FMAD.mat')
for i=1:65
X=FMAD{i};
filename=strcat('ADCP_',num2str(i),'.png');
imwrite(X,filename);
end