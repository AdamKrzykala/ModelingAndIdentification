function mi = estymJ(x,UN,YN,hN)
    sum1 = 0;
    sum2 = 0;
    for i=1:length(UN)
        sum1 = sum1 + YN(i)*K(hN,UN(i),x);
        sum2 = sum2 + K(hN,UN(i),x);
    end
    mi = sum1 / sum2;
end

