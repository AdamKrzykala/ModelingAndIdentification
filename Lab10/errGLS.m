function err = errGLS(b,N,L,s)
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
    for i=1:L
        ZN = normrnd(0,1,[N,1]);
        YN = Phi*b' + ZN;
        estymB = inv(Phi'*Phi)*Phi'*YN;
        err = err + norm(estymB - b',2);
    end
    err = err / L;
end

