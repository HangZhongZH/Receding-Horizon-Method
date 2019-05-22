clc
clear all

r = 1;

%Monte Carlo simulations
MC_num = 1000;

costpredictfee = zeros(4, 6);

%% different choices of prediction and control horizons
for h_ctrl = 1: 4
    for h_pred = h_ctrl: 6
        [y_best(:, h_ctrl, h_pred), costpredictfee(h_ctrl, h_pred)] = costpredict(h_pred, h_ctrl, MC_num, r);
    end
end
task31 = figure('Name', 'the cost fee under different value of y');
h_ctrl = 1: 3;
h_pred = 1: 6;
bar3(costpredictfee)
set(gca,'xticklabel',h_ctrl,'yticklabel',h_pred)
xlabel('hctrl')
ylabel('hpred')
zlabel('costfee')
%saveas(task31, 'task31.png')



%% 
h_pred2 = 5;
MC_num2 = 1000;

for j = 1: MC_num2
    for h_ctrl = 1: 4
        [y_best(h_ctrl, :), costpredictfee2(j, h_ctrl)] = costpredict(h_pred2, h_ctrl, MC_num, r);
    end
end
costpredictfeemean = mean(costpredictfee2, 1);


%plot(costpredictfeemean)



           