function [detectedSymbolsIndex, rxSymbols] = pulseDemodulation(rxSamples, modulation, M, fs, nSymbolSamples, pulseName , rxMode, varargin)
p = pulse_shape(pulseName, fs, nSymbolSamples);
[rxSymbols] = symbolDetection(rxSamples, p, nSymbolSamples, rxMode);
[cons, ~] = constellation(M, modulation);
[detectedSymbolsIndex] = minDistanceDetector(rxSymbols, cons);


end