%Funkcja zwracająca wartość estymatora dla x
%Baza cosinusowa param1 = L
function estymM = estymM(X,Y,x,type,param1)
    if type == "cos"
        totalSumG = 0;
        totalSumF = 0;
        for k=0:param1
            estymA = 0;
            estymB = 0;
            for i=1:length(X)
                temp = ficos(X(i),k); 
                estymA = estymA + Y(i)*temp; 
                estymB = estymB + temp; 
            end
            estymA = estymA / length(X);
            estymB = estymB / length(X);
            totalSumG = totalSumG + estymA*ficos(x,k);
            totalSumF = totalSumF + estymB*ficos(x,k);
            
        end
        estymM = totalSumG / totalSumF;
    end
end

function y = ficos(x,k)
    if k == 0
       y = sqrt(1/(2*pi)); 
    else
       y = sqrt(1/pi)*cos(k*x);
    end
end

