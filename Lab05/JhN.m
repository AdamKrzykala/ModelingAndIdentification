function y = JhN(population,hN,minVal,maxVal)
    [fN,x] = KernelDensityEstimate(population,minVal,maxVal,0.01,hN,"Gaussian");
    firstPart = trapz(x,fN.^2);
    secondSum = 0;
    for k=1:length(population)
        secondSum = secondSum + g(k,population,hN,"Gaussian");
    end
    secondSum = 2*secondSum/length(population);
    y = firstPart - secondSum;
end

