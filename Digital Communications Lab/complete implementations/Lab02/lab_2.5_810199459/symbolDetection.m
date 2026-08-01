function [rxSymbols] = symbolDetection(rxSamples, p, nSymbolSamples, rxMode)
    switch rxMode
        case 'matched_filter'
            
            temp = conv(rxSamples,p);
            r_index = (1:10)*nSymbolSamples + 1;
            rxSymbols = temp(r_index);
            
        case 'correlator'
            
            rxSymbols = zeros(length(rxSamples)/nSymbolSamples,1);
            pprim=conj(p);
            for i=1:10
               temp_signal = rxSamples((i-1)*nSymbolSamples+1 :nSymbolSamples*i);
               rxSymbols(i) = sum(pprim.*temp_signal);
            end
    end

end

