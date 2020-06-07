%Estymator jądrowy

clear all;
close all;
lambda = [-0.5 0.6 0.1 -0.9 0.7];
c2 = 4;
N = 1000000;
UN = unifrnd(-1,1,[N,1]);
VN = zeros(N,1);
for i=1:N
   VN(i) = c2*atan(UN(i));
end

eN = normrnd(0,1,[N,1]);
v = zeros(N,length(lambda));

for i=1:length(lambda)
   for j=1:(N-i+1)
      v(j+i-1,i) = VN(j); 
   end
end

YN = v*lambda' + eN;

x = -1:0.01:1;
y = c2*atan(x);
J = zeros(length(x),1);
for j=1:length(x)
   J(j) = estymJ(x(j),UN,YN,0.01);
end
figure(1)
hold on;
plot(x,y,"LineWidth",4)
plot(x,J,"LineWidth",4)
%plot(UN,YN,"*")
title("Zachowanie systemu i estymatora")
xlabel("Un")
ylabel("Wyjście")
legend("m(u)","Estymator","Pomiary wejście-wyjście")