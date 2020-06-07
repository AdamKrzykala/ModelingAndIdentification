function estym = estymParam(UN,YN,l)
    sum = 0;
    for i=(l+1):length(UN)
       sum = sum + UN(i-l)*YN(i); 
    end
    estym = sum / ( length(UN)-l );
end

