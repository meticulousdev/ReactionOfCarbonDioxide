function Rsq = LeastSquares(expX, expY, calX, calY)
% Author : 'L'
% Modified : 20140728
% Fuction : Calculate R^2.
% Input : X Y T C
% Return : result.
% X, Y : Experimental data,
% T, C : Fitting data.

n = length(calX);
j = 1;

m = length(expY);
Y_cal = zeros(1, m);

for i = 1 : n
    if calX(i) == expX(j)
        Y_cal(j) = calY(i);
        j = j + 1;
    end
end

meanY = mean(expY);
St = 0;
Sr = 0;

for i = 1 : m
    St = St + (expY(i) - meanY)^2;
    Sr = Sr + (expY(i) - Y_cal(i))^2;
end

Rsq = (St - Sr) / St;
end