function [p, t] = pulseShape(pulseName, fs, nSymbolSamples)
    Ts = nSymbolSamples / fs;
    t = 0 : 1/fs : Ts - 1 / fs;
    t = t';
    if pulseName == 'triangular'
        p = max(Ts/2 - abs(t-Ts/2) , 0);
    end
    p = p / sqrt(abs(p' * p));   %normalize
end