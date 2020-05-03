function y = empValue(population,x)
    y = 0;
    for i=1:length(population)
       if population(i) <= x
          y = y + 1;
       end
    end
    y = y/length(population);
end

