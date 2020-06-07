clear all;
close all;
%Definicja systemu SISO
b = [3 5 1 9 3 7];

N = 1000;
r = zeros(N,1);
r(1) = 1.25;
r(2) = 0.5;
R = toeplitz(r);
s = 5;
UN = normrnd(0,1,[N,1]);
ZN = normrnd(0,1,[N,1]);
Phi = zeros(N,s+1);
Phi(:,1) = UN;

for i=1:N
   for j=2:(s+1)
       if i - j < 0
           Phi(i,j) = 0;
       else
           Phi(i,j) = Phi(i-j+1,1);
       end
   end
end

YN = Phi*b' + ZN;
estymB1 = inv(Phi'*Phi)*Phi'*YN
estymB2 = inv(Phi'*inv(R)*Phi)*Phi'*inv(R)*YN