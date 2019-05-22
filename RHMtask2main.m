clear all
clc

%prediction and control horizons
h_pred = 3;
h_ctrl = 3;

%Monte Carlo simulations
MC_num = 1000;
MC_num2 = 1000;

%from assignment 1
r = 1;

for i = 1: MC_num2
    [y_best, costpredict2(i)] = costpredict(h_pred, h_ctrl, MC_num, r);
end

a1 = figure()
hist(costpredict2)
mean(costpredict2)
%saveas(a1,'a1.png')