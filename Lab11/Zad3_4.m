clear all;
close all;
N = 10000;
theta = [2,0.5];
UN = unifrnd(0,1,[N,1]);
Phi = zeros(N,2);
Phi(:,1) = UN;
e = unifrnd(-1,1);
Zn = zeros(N,1);
for i=1:length(Zn)
    new_e = unifrnd(-1,1);
    Zn(i) = new_e - theta(2)*e; 
    e = new_e;
end

for i=2:(N)
   Phi(i,2) = Phi(i-1,:)*theta' + Zn(i-1);
end

Y = Phi*theta' + Zn;
estymT = inv(Phi'*Phi)*Phi'*Y