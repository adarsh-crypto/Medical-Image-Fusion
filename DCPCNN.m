function R=DCPCNN(A,B)


%Absolute values can be used

alpha_f=0.7; % alpha_f


V_E=20;


alpha_e=0.2;

V_L=1.0;

betaAI=WSEML(A);
betaA=betaAI/max(betaAI(:));

betaBI=WSEML(B);
betaB=betaBI/max(betaBI(:));

iteration_times=120;

%DCPCNN

[p,q]=size(A);
F1=abs(A);
F2=abs(B);
U=zeros(p,q);
Y=zeros(p,q);
T=zeros(p,q);
E=ones(p,q);


W=[0.707 1 0.707;1 0 1;0.707 1 0.707];

for n=1:iteration_times
    K = V_L*conv2(Y,W,'same');
    U1=F1.* (1 + betaA .* K);
    U2=F2.* (1 + betaB .* K);
    map=(U1>=U2);
    U3=map.*U1+~map.*U2;
    U = exp(-alpha_f) * U + U3;
    Y = im2double( U > E );
    E = exp(-alpha_e) * E + V_E * Y;
    
end

R =(U1>=U2);
end


