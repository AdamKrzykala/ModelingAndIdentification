function output = K(hN,Un,x)
    if abs((Un-x)/hN) <= 1/2
        output = 1;
    else
        output = 0;
    end
end

