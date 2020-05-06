clear all;
close all;

L = 10;
n = 500;
a = 2;
%Generowanie populacji
Xp = unifrnd(-2,2,[n,L]);
Zp = normrnd(0,1,[n,L]);
Yp = atan(a.*Xp) + Zp;


hN = 0.01:0.01:1;


figure(1)
%Wskaznik jakosci dla Boxcar
subplot(2,2,1)
grid minor;
title("Boxcar")
xlabel("hN")
ylabel("valid(hN)")
for i=1:length(hN)
    valid(i) = 0;
    for l=1:L
        X = Xp(:,l);
        Y = Yp(:,l);
        [y,x] = KernelRegressionEstimate(X,Y,-1,1,0.01,hN(i),"Boxcar");
        sum = 0;
        for j=1:length(x)
            sum = sum + (y(j)-atan(a*x(j)))^2;
        end
        valid(i) = valid(i) + sum/length(x);
    end
    valid(i) = valid(i)/L;
    i
end
hold on;
plot(hN,valid)
idx = find(valid == min(valid(:)));
hN(idx);
yline(min(valid),"--",sprintf('y = %f dla hN = %f', min(valid),hN(idx)),"LineWidth",2,"LabelHorizontalAlignment", "left")

%Wskaznik jakosci dla Gaussian
subplot(2,2,2)
grid minor;
title("Gaussian")
xlabel("hN")
ylabel("valid(hN)")
for i=1:length(hN)
    valid(i) = 0;
    for l=1:L
        X = Xp(:,l);
        Y = Yp(:,l);
        [y,x] = KernelRegressionEstimate(X,Y,-1,1,0.01,hN(i),"Gaussian");
        sum = 0;
        for j=1:length(x)
            sum = sum + (y(j)-atan(a*x(j)))^2;
        end
        valid(i) = valid(i) + sum/length(x);
    end
    valid(i) = valid(i)/L;
    i
end
hold on;
plot(hN,valid)
idx = find(valid == min(valid(:)));
hN(idx);
yline(min(valid),"--",sprintf('y = %f dla hN = %f', min(valid),hN(idx)),"LineWidth",2,"LabelHorizontalAlignment", "left")

%Wskaznik jakosci dla Epanechnikov
subplot(2,2,3)
grid minor;
title("Epanechnikov")
xlabel("hN")
ylabel("valid(hN)")
for i=1:length(hN)
    valid(i) = 0;
    for l=1:L
        X = Xp(:,l);
        Y = Yp(:,l);
        [y,x] = KernelRegressionEstimate(X,Y,-1,1,0.01,hN(i),"Epanechnikov");
        sum = 0;
        for j=1:length(x)
            sum = sum + (y(j)-atan(a*x(j)))^2;
        end
        valid(i) = valid(i) + sum/length(x);
    end
    valid(i) = valid(i)/L;
    i
end
hold on;
plot(hN,valid)
idx = find(valid == min(valid(:)));
hN(idx);
yline(min(valid),"--",sprintf('y = %f dla hN = %f', min(valid),hN(idx)),"LineWidth",2,"LabelHorizontalAlignment", "left")

%Wskaznik jakosci dla Tricube
subplot(2,2,4)
grid minor;
title("Tricube")
xlabel("hN")
ylabel("valid(hN)")
for i=1:length(hN)
    valid(i) = 0;
    for l=1:L
        X = Xp(:,l);
        Y = Yp(:,l);
        [y,x] = KernelRegressionEstimate(X,Y,-1,1,0.01,hN(i),"Tricube");
        sum = 0;
        for j=1:length(x)
            sum = sum + (y(j)-atan(a*x(j)))^2;
        end
        valid(i) = valid(i) + sum/length(x);
    end
    valid(i) = valid(i)/L;
    i
end
hold on;
plot(hN,valid)
idx = find(valid == min(valid(:)));
hN(idx);
yline(min(valid),"--",sprintf('y = %f dla hN = %f', min(valid),hN(idx)),"LineWidth",2,"LabelHorizontalAlignment", "left")

