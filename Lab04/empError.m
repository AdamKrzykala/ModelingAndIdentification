function Sum = empError(L,Sgen,Serr,mu,sigma)
    xn = -10:1/Sgen:10;
    xm = -10:1/Serr:10;
    M = length(xm);
    Sum = 0;
    for j=1:L
        for i = 1:length(xn)
            F(i) = normrnd(mu,sigma); 
        end
        sum = 0;
        for k=1:length(xm)
            sum = sum + (empValue(F,xm(k))-normDistvalue(xm(k),1,1))^2;
        end
        sum = sum / length(xm);
        Sum = Sum + sum;
    end
    Sum = Sum / L;
end
