function [cons, symbolEnergy] = constellation(M, modulationName)
    if modulationName == 'pam'
        cons = -(M - 1) : 2 : M - 1;
        cons = cons';
        symbolEnergy = abs(cons'*cons)/M;
        cons = cons / sqrt(symbolEnergy);   %normalize 
    end
end