function [errS,errN] = errMNK(N,D,mu,sigmaX,sigmaZ,a,L)
    muX = ones(1,D)*mu;

    sigma = eye(D)*sigmaX;
    rng('default')  % For reproducibility
    X = mvnrnd(muX,sigma,N);
    
    e = normrnd(0,1,[N,1]);
    Zn = zeros(N,N);
    Zs = zeros(N,N);
    Yn = zeros(N,N);
    Ys = zeros(N,N);
    totalSumN = 0;
    totalSumS = 0;
    for l=1:L
        for i=1:N
            e_new = normrnd(0,sigmaZ,[N,1]);
            Zn(:,i) = e_new;
            Zs(:,i) = e_new + 0.5*e;
            temp = X * a';
            for j=1:N
                Yn(j,i) =  temp(j) + Zn(j,i);
            end
            for j=1:N
                Ys(j,i) =  temp(j) + Zs(j,i);
            end
            e = e_new;
        end

        estymAs = (X'*X)^(-1)*X'*Ys;
        estymAn = (X'*X)^(-1)*X'*Yn;
        estymVectors = zeros(D,1);
        estymVectorn = zeros(D,1);
        for i=1:D
            for j=1:N
                estymVectors(i) = estymVectors(i) +  estymAs(i,j);
                estymVectorn(i) = estymVectorn(i) +  estymAn(i,j);
            end
            estymVectors(i) = estymVectors(i) / N;
            estymVectorn(i) = estymVectorn(i) / N;
        end
        totalSumS = totalSumS + norm(estymVectors - a',2);
        totalSumN = totalSumN + norm(estymVectorn - a',2);
    end
    errS = totalSumS/L;
    errN = totalSumN/L;
end
