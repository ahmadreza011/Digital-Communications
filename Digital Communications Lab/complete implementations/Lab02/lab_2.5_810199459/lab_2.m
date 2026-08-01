%%
rng(1);
nSymbolSamples = 8;
nPacketSymbols = 10;
M = 4;
k = log2(M);

txBit = randi(2,nPacketSymbols,k) - 1;

%%

grayMatrix = grayMatrixGenerator(2);

%%

symbolIndex = zeros(nPacketSymbols,1);
for i=1:length(txBit)
    t = txBit(i,:);
    for j=0:length(grayMatrix)-1
        if grayMatrix(j+1,:) == t
            symbolIndex(i) = j;
            break;
        end
    end
end
%%

mod_values = constellation(4,'pam');
mod_sym = zeros(nPacketSymbols,1);
for i=1:length(symbolIndex)
    mod_sym(i) = mod_values(symbolIndex(i)+1);   
end
%%

txSamples = pulseModulation(symbolIndex, 'pam', 4, 10, 8, 'triangular' , 'conv', 0);
t = 1:80;
stem(t,txSamples)
title('txout Entries')
xlabel('Samples')










