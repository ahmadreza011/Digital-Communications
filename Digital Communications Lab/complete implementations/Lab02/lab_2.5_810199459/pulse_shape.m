function [p] = pulse_shape(pulse_name, fs, nSymbolSamples)
    ts = 1/fs;             
    Ts = nSymbolSamples*ts;
    pulse_name = lower(pulse_name);
    if nargin == 3
        t = (0:nSymbolSamples-1)' * ts;
        switch pulse_name
            case 'triangular'
                p = max( Ts/2 - abs(t-Ts/2) , 0);
        end
    end
    Ep = abs(p' * p);
    p = p / sqrt(Ep);

end