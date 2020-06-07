function err = errGLSskor(b,N,L,s)
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
    ZN = zeros(N,1);
    for i=1:L
        e = normrnd(0,1);
        for k=1:N
            temp_e = normrnd(0,1);
            ZN(k) = temp_e + 0.5*e;
            e = temp_e;
        end
        YN = Phi*b' + ZN;
        estymB = inv(Phi'*Phi)*Phi'*YN;
        err = err + norm(estymB - b',2);
    end
    err = err / L;
end