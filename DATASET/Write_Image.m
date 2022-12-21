load('DMF.mat')
for i=1:65
    for j=1:2
X=DMF{i,j+1};
filename=strcat('INPUTMED_',num2str(i),num2str(j),'.png');
imwrite(X,filename);
    end
end