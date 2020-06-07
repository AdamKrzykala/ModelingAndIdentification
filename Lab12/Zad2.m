%Generowanie obserwacji
clear all;
close all;
lambda = [-0.5 0.6 0.1 -0.9 0.7];
c2 = 4;
N = 1000;
UN = unifrnd(-1,1,[N,1]);
VN = c2*atan(UN);
eN = normrnd(0,1,[N,1]);
v = zeros(N,length(lambda));

for i=1:length(lambda)
   for j=1:(N-i+1)
      v(j+i-1,i) = VN(j); 
   end
end
v
UN;
YN = v*lambda' + eN;
x = -1:0.01:1;
y = c2*atan(x);
figure(1)
hold on;
plot(x,y,"LineWidth",2)
plot(UN,YN,"*")