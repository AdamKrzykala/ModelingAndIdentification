function r = correlation(X,Y)
    x_m = mean(X);
    y_m = mean(Y);
    sum_nom = 0;
    sum_den_1 = 0;
    sum_den_2 = 0;
    for i=1:length(X)
        sum_nom = sum_nom + (X(i)-x_m)*(Y(i)-y_m);
        sum_den_1 = sum_den_1 + (X(i)^2 - x_m^2);
        sum_den_2 = sum_den_2 + (Y(i)^2 - y_m^2);
    end
    sum_nom = sum_nom / length(X);
    sum_den_1 = sum_den_1 / length(X);
    sum_den_2 = sum_den_2 / length(X);
    r = sum_nom / (sqrt(sum_den_1*sum_den_2));
end

