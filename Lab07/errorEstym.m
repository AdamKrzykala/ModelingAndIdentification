function valid = errorEstym(L,Q,type,X,Y,a)
    q = -Q:0.1:Q;
    totalSum = 0;
    if type == "cos"
        for i=1:length(q)
            totalSum = totalSum + (estymM(X,Y,2*q(i)/Q,"cos",L) - m(2*q(i)/Q,a))^2;
        end
        valid = totalSum/(2*Q);
    end
end

