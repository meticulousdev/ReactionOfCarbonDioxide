function ReactionOfCarbonDioxide(fileName)
% % 초기화
% DATA : 행렬이 저장될 구조체
Data = load(fileName, 'desArr');
xdata = Data.desArr(:, 1);
ydata = Data.desArr(:, 2);

% % 처리
% lsqcurvefit
ko = [0.00000001479715128, 592.220531];
lb = [0, 0];
ub = [1e4, 1e4];
[k, resnorm] = lsqcurvefit(@(k, xdata) ReactionOfCarbonDioxideLsqfit ...
    (k, xdata, ydata, @ReactionOfCarbonDioxideODE), ko, xdata, ydata, lb, ub);

% ode
[T, P] = ReactionOfCarbonDioxideODESolve(k, xdata, ydata, @ReactionOfCarbonDioxideODE);

% % 출력
% 계산 결과
fprintf('k_rxn : %E, xo : %f\n', k(1), k(2));

% 그래프
plot(xdata, ydata); hold on;
plot(T, P, 'r'); hold on;

xlabel('time (hr)');
ylabel('pressure (mmHg)');

if length(ydata) == length(P(:, 1))
    text1 = num2str(LeastSquares(xdata, ydata, T, P));
    text2 = strcat('R^2 = ', text1);
    text(xdata(80), ydata(60), text2);
end
legend('Experimental Data', 'Numerical Fitting', 'Location', 'SouthWest');
% function ReactionOfCarbonDioxide

function F = ReactionOfCarbonDioxideLsqfit(k, xdata, ydata, pfunc)
[T, P] = ReactionOfCarbonDioxideODESolve(k, xdata, ydata, pfunc);

[row, col] = size(P);
n = length(T);
m = length(xdata);
F = zeros(m, 1);
j = 1;
for i = 1 : n
    if T(i) == xdata(j)
        F(j) = P(i);
        j = j + 1;
    end
end
% function F = ReactionOfCarbonDioxideLsqfit(k, xdata, ydata, pfunc)

function [X, Y] = ReactionOfCarbonDioxideODESolve(k, xdata, ydata, pfunc)
tspan = [xdata(1) : 1 : xdata(end)];
Abs_Tol = 1e-4;
po = 815;
options = odeset('RelTol', 1e-4, 'AbsTol', Abs_Tol);

[X, Y] = ode23s(@(x, y) pfunc (x, y, k), tspan, po, options);
% function [X, Y] = ReactionOfCarbonDioxideODESolve(k, xdata, ydata, pfunc)

function dp = ReactionOfCarbonDioxideODE(t, p, k)
% 초기화
% a : conversion
% n : the base Carbon Dioxide Pressure and the power n
% m : the base Proton and the power m
len = length(p);
dp = zeros(len, 1);

k_rxn = k(1);
xo = k(2);

po = 815;

% dp = - k_rxn * (p ^ n) * (a ^ m);
% dp = - k_rxn * (R * T / (-2 * xo)) * ((po - 2 * xo * p) ^ n) * ((xo * (1 - p)) ^ m);
% dp = - k_rxn * (p ^ n);
% dp = - k_rxn * (p ^ n) * ((p + xo + a * xo - po) ^ m);
dp = - k_rxn * p * (xo - po / 2 + p / 2)^2;
% function dp = ReactionOfCarbonDioxideODE(t, p, k)
