function [txSamples, cons] = pulseModulation(symbolIndex, modulation, M, fs, nSymbolSamples, pulseName, pulseShapingMode, varargin)
    [cons, symbolEnergy] = constellation(M, modulation);
    [p, t] = pulseShape(pulseName, fs, nSymbolSamples);
    symbol_array = zeros(length(symbolIndex), 1);  %% just like step 3 in part 2
    for i = 1 : length(symbolIndex)
        symbol_array(i) = cons(symbolIndex(i) + 1);   
    end
    if pulseShapingMode == 'kron'
        txSamples = kron(symbol_array,p);
    elseif pulseShapingMode == 'conv'
        temp = upsample(symbol_array, length(p));
        symbolArrayZeroPad = temp(1: end - length(p) + 1);    % removing last zeros
        txSamples = conv(symbolArrayZeroPad, p);
    end

end