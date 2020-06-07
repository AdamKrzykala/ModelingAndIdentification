function [err, errSkor, errSkorBLUE] = errComp(b,N,L,s)
    r = zeros(N,1);
    r(1) = 1.25;
    r(2) = 0.5;
    R = toeplitz(r);
    UN = normrnd(0,1,[N,1]);
    Phi = zeros(N,s+1);
    Phi(:,1) = UN;
    for i=1:N
       for j=2:(s+1)
           if i - j < 0
               Phi(i,j) = 0;
           else
               Phi(i,j) = Phi(i-j+1,1);
           end
       end
    end
    err = 0;
    errSkor = 0;
    errSkorBLUE = 0;
    ZNskor = zeros(N,1);
    for i=1:L
        ZN = normrnd(0,1,[N,1]);
        e = normrnd(0,1);
        for k=1:N
            temp_e = normrnd(0,1);
            ZNskor(k) = temp_e + 0.5*e;
            e = temp_e;
        end
        YN = Phi*b' + ZN;
        YNskor = Phi*b' + ZNskor;
        estymB = inv(Phi'*Phi)*Phi'*YN;
        estymBskor = inv(Phi'*Phi)*Phi'*YNskor;
        estymBskorBLUE = inv(Phi'*inv(R)*Phi)*Phi'*inv(R)*YNskor;
        err = err + norm(estymB - b',2);
        errSkor = errSkor + norm(estymBskor - b',2);
        errSkorBLUE = errSkorBLUE + norm(estymBskorBLUE - b',2);
    end
    err = err / L;
    errSkor = errSkor / L;
    errSkorBLUE = errSkorBLUE / L;
end