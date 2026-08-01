function tx_bit = bitGenerator(nPacketSymbols, k)
    rng(1)
    tx_bit = randi(2, nPacketSymbols, k) - 1;
end