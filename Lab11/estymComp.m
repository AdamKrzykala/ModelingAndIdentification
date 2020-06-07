function [estymTerr,estymTIVerr] = estymComp(theta,N,L)
    UN = unifrnd(0,1,[N,1]);
    Phi = zeros(N,2);
    Phi(:,1) = UN;
    Psi = zeros(N,2);
    Psi(:,1) = UN;
    totalSumT = 0;
    totalSumTIV = 0;
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
        totalSumT = totalSumT + norm(estymT-theta',2)^2;
        
        Psi = zeros(N,2);
        Psi(:,1) = UN;

        for i=2:(N)
           Psi(i,2) = Psi(i-1,:)*estymT;
        end
        
        estymTIV = inv(Psi'*Phi)*Psi'*Y;
        totalSumTIV = totalSumTIV + norm(estymTIV-theta',2)^2;
    end
    estymTerr = totalSumT / L;
    estymTIVerr = totalSumTIV / L;
end

