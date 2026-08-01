%%
p = pulse_shape('triangular', 1, 8);

rxSymbols = symbolDetection(txSamples, p, 8, 'correlator');
%%
[const, ~] = constellation(4, 'pam');

[detectedSymbols] = minDistanceDetector(rxSymbols, const);

%%
%correlator
[detectedSymbolsIndex, rxSymbols] = pulseDemodulation(txSamples, 'pam', 4, 1, 8, 'triangular' , 'correlator', 0);

%%
%matchedFilter
[detectedSymbolsIndex, rxSymbols] = pulseDemodulation(txSamples, 'pam', 4, 1, 8, 'triangular' , 'matched_filter', 0);

%%
detectedBits = zeros(nPacketSymbols,k);
for i=1:10
 
    detectedBits(i,:) = grayMatrix(detectedSymbolsIndex(i),:);
end
