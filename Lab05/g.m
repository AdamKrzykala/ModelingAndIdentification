function y = g(k,population,hN,type)
    sum = 0;
    for n=1:length(population)
        if n ~= k
            if type == "Gaussian"
               sum = sum + gaussian((population(n)-population(k))/hN);
            end
        end
    end
    y = sum/((length(population)-1)*hN);
end


function y = gaussian(x)
    y = 1/sqrt(2*pi) * exp(-x^2/2);
end