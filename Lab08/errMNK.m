function err = errMNK(N,D,mu,sigmaX,sigmaZ,a,L)
    muX = ones(1,D)*mu;
    sigma = eye(D)*sigmaX;
    rng('default')  % For reproducibility
    X = mvnrnd(muX,sigma,N);
    Z = zeros(N,1);
    totalSum = 0;
    for l=1:L
        for i=1:length(Z)
            Z(i) = normrnd(0,sigmaZ); 
        end
        Y = X * a' + Z;
        estymA = (X'*X)^(-1)*X'*Y;
        totalSum = totalSum + norm(estymA - a',2)^2;
    end
    err = totalSum/L;
end

