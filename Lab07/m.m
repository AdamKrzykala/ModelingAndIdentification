function y = m(x,a)
    if abs(x) < 1
        y = a*x^2;
    else if abs(x) < 2
        y = 1;
        else
            y = 0;
        end
    end
end

