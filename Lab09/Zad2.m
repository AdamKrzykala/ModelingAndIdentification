clear all;
close all;

N = 10000;
e = zeros(N+1,1);
Z = zeros(N,1);
for i=1:length(e)
   e(i) = normrnd(0,1); 
end

for i=1:length(Z)
   Z(i) = e(i+1) + 0.5*e(i); 
end
