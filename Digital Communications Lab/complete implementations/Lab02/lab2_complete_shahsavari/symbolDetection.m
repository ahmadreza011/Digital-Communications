function [rxSymbols] = symbolDetection(rxSamples, p, nSymbolSamples, rxMode)
    switch rxMode
        case 'matched_filter'
            rxSymbols = zeros(length(rxSamples)/nSymbolSamples, 1);
            for i = 1 : length(rxSymbols)
                rxSymbols(i) = conv(flip(conj(p)), rxSamples((i - 1) * nSymbolSamples + 1 : i * nSymbolSamples), 'valid');
            end
        case 'correlator' 
            rxSymbols = zeros(length(rxSamples)/nSymbolSamples, 1);
            for i = 1 : length(rxSymbols)
                rxSymbols(i) = sum(conj(p) .* rxSamples((i - 1) * nSymbolSamples + 1 : i * nSymbolSamples));
            end
    end
end