function [detectedSymbols] = minDistanceDetector(rxSymbols, constellation)
    detectedSymbols = zeros(length(rxSymbols),1);
        for i=1:length(rxSymbols)
           
           distance = abs(constellation - rxSymbols(i));
           [~,detectedSymbols(i)] = min(distance); 
        end
end