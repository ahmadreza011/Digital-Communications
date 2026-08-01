function [detectedSymbolsIndex, rxSymbols] = pulseDemodulation(rxSamples, modulation, M, fs, nSymbolSamples, pulseName , rxMode, varargin)
    [p, t] = pulseShape(pulseName, fs, nSymbolSamples);
    rxSymbols = symbolDetection(rxSamples, p, nSymbolSamples, rxMode);
    [cons, symbolEnergy] = constellation(M, modulation);
    [detectedSymbols] = minDistanceDetector(rxSymbols, cons);
    [~,detectedSymbolsIndex] = max(detectedSymbols == cons',[],2);
end