function [txSamples, cons] = pulseModulation(symbolIndex, modulation, M, fs, nSymbolSamples, pulseShape , pulseShapingMode, varargin) 

    [cons, E] = constellation(M, modulation);
    [p] = pulse_shape(pulseShape, fs, nSymbolSamples);
    mod_sym = zeros(length(symbolIndex),1);
    for i=1:length(symbolIndex)
        mod_sym(i) = cons(symbolIndex(i)+1);   
    end
    if pulseShapingMode=="kron"
        txSamples = kron(mod_sym,p);
    elseif pulseShapingMode == "conv"
         symbolArrayZeroPad=upsample(mod_sym,nSymbolSamples);
         symbolArrayZeroPad=symbolArrayZeroPad(1:end-nSymbolSamples+1);
         txSamples = conv(symbolArrayZeroPad,p);
    end

end