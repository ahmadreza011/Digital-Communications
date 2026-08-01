function [grayMatrix] = grayMatrixGenerator(k)
    if k == 1
        grayMatrix = [0;1];
    else
        Zeros = zeros(2^(k-1), 1);
        Ones = ones(2^(k-1), 1);
        prev_Ak = grayMatrixGenerator(k-1);
        prev_Ak_B = prev_Ak(end:-1:1, :);
        grayMatrix = [Zeros, prev_Ak; Ones, prev_Ak_B];
    end
end
