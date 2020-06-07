function err = errParam(UN,lambda,v,L)
    lambdaEstym = zeros(1,5);
    totalSum = 0;
    for k=1:L
        eN = normrnd(0,1,[length(UN),1]);
        YN = v*lambda' + eN;
        for i=1:length(lambda)
           lambdaEstym(i) = estymParam(UN,YN,i-1); 
        end
        totalSum = totalSum + norm(lambdaEstym' - lambda',2)^2;
    end
    err = totalSum / L;
end

