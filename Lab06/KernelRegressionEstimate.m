function [fN,x] = KernelRegressionEstimate(X,Y,minArg,maxArg,step,hN,type)
    N = length(X);
    x = minArg:step:maxArg;
    for j=1:length(x)
        sum1 = 0;
        sum2 = 0;
        for i=1:N
            value = (X(i)-x(j))/hN;
            if type == "Boxcar"
                K = boxcar(value);
            elseif type == "Gaussian"
                K = gaussian(value);
            elseif type == "Epanechnikov"
                K = epanechnikov(value);
            elseif type == "Tricube"
                K = tricube(value);
            end
            sum2 = sum2 + K;
            sum1 = sum1 + Y(i)*K;
        end
        fN(j) = sum1 / sum2; 
    end
end

function y = boxcar(x)
    if abs(x) <= 1
        y = 1/2;
    else
        y = 0;
    end
end

function y = gaussian(x)
    y = 1/sqrt(2*pi) * exp(-x^2/2);
end

function y = epanechnikov(x)
    if abs(x) <= 1
        y = 3/4*(1-x^2);
    else
        y = 0;
    end
end

function y = tricube(x)
    if abs(x) <= 1
        y = 70/81*(1-abs(x)^3)^3;
    else
        y = 0;
    end
end
