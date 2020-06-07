function Y = imp(U,theta)
    Y = zeros(length(U),1);
    for i=1:length(Y)
        Y(i) = theta(1)*U(i);
        if i > 1
            Y(i) = Y(i) + theta(2)*U(i-1); 
            Y(i) = Y(i) + theta(3)*Y(i-1);
        end
        if i > 2
            Y(i) = Y(i) + theta(4)*Y(i-2); 
        end
    end
end

