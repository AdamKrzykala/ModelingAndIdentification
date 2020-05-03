function y = normDistvalue(x,mu,sigma)
    y = 1/2*(1+erf((x-mu)/(sigma*sqrt(2))));
end

