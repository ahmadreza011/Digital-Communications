function [grayMatrix] = grayMatrixGenerator(k)
    if k == 1
        grayMatrix = [0;1];
    else
        z = zeros(2^(k-1), 1);
        o = ones(2^(k-1), 1);
        t = grayMatrixGenerator(k-1);
        grayMatrix = [z, t; o, t(end:-1:1, :)];
    end
end
