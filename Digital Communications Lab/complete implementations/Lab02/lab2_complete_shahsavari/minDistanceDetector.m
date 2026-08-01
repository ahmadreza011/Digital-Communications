function [detectedSymbols] = minDistanceDetector(rxSymbols, constellation)
    detectedSymbols = zeros(length(rxSymbols), 1);
        for i = 1 : length(rxSymbols)
           distance = abs(constellation - rxSymbols(i));
           [~,detectedSymbolsIndex] = min(distance);
           detectedSymbols(i) = constellation(detectedSymbolsIndex);
        end
end