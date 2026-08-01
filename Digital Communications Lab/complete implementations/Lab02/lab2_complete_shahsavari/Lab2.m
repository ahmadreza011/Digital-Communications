%% experiment 2-1 :
%% part 1 :
M = 4;
k = log2(M);
nPacketSymbols = 10;
tx_bit = bitGenerator(nPacketSymbols, k);

%% part 2 :
%step 1 :
grayMatrix = grayMatrixGenerator(2);
%step 2 :
symbolIndex = zeros(nPacketSymbols, 1);
for i= 1 : nPacketSymbols
    for j = 1 : length(grayMatrix)
        if grayMatrix(j, :) == tx_bit(i, :)
            symbolIndex(i) = j - 1;
            break;
        end
    end
end
%step 3 :
[cons, symbolEnergy] = constellation(M,'pam');
symbolArray = zeros(nPacketSymbols, 1);
for i = 1 : length(symbolIndex)
    symbolArray(i) = cons(symbolIndex(i) + 1);   
end
%% part 3 :
nSymbolSamples = 8;
[txSamples, cons] = pulseModulation(symbolIndex, 'pam', M, 1,nSymbolSamples, 'triangular' , 'kron', 0);  %kron
%[txSamples, cons] = pulseModulation(symbolIndex, 'pam', M, 1, nSymbolSamples, 'triangular' , 'conv', 0);   %conv
t = 1 : 1 : 80;
stem(t,txSamples, 'filled')
title('tx-out Entries')
xlabel('Samples')
%% experiment 2-2 :
%% part 1 :
[p, t] = pulseShape('triangular', 1, nSymbolSamples);

rxSymbols = symbolDetection(txSamples, p, nSymbolSamples, 'correlator' );        %correlator
%rxSymbols = symbolDetection(txSamples, p, nSymbolSamples,'matched_filter');    %matched filter

%% part 2 :
detectedSymbols = minDistanceDetector(rxSymbols, cons);

%% part 3 :
rxSamples = txSamples;
[detectedSymbolsIndex, rxSymbols] = pulseDemodulation(rxSamples, 'pam', M, 1, nSymbolSamples, 'triangular' , 'correlator');    %correlator
%[detectedSymbolsIndex, rxSymbols] = pulseDemodulation(rxSamples, 'pam', M, 1, nSymbolSamples, 'triangular' , 'matched_filter');  %matched filter

%% part 4 :
detectedBits = grayMatrix(detectedSymbolsIndex, :);








