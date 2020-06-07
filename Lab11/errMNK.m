function err = errMNK(theta,L,N)
    UN = unifrnd(0,1,[N,1]);
    Phi = zeros(N,2);
    Phi(:,1) = UN;
    totalSum = 0;
    for l=1:L
        e = unifrnd(-1,1);
        Zn = zeros(N,1);
        for i=1:length(Zn)
            new_e = unifrnd(-1,1);
            Zn(i) = new_e - theta(2)*e; 
            e = new_e;
        end
        for i=2:(N)
           Phi(i,2) = Phi(i-1,:)*theta' + Zn(i-1);
        end
        Y = Phi*theta' + Zn;
        estymT = inv(Phi'*Phi)*Phi'*Y;
        totalSum = totalSum + norm(estymT - theta',2)^2;
    end
    err = totalSum / L;
end

