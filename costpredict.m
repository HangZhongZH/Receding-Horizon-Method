function [y_best, costpredict2] = costpredict(h_pred, h_ctrl, MC_num, r)

%range of re-order number
ymin = 0;
ymax = 6;
y = [ymin: ymax];


for stock_end_last = 0: 6
	[y_best(stock_end_last + 1), iforder(stock_end_last + 1)] = predMC_noreturn(y, h_pred, h_ctrl, MC_num, r, stock_end_last);
end

%total weeks
N = 52;

%Monte Carlo simulations
for j = 1: MC_num
    %initial the stock
    stock_end_last = 0;
    for i = 1: N - 1
        y = y_best(stock_end_last + 1);
        [stock_end, costfee(j, i)] = costfee_oneweek(stock_end_last, y, r);
        stock_end_last = stock_end;
    end
    [costfee(j, N), ~] = costfee_lastweek(stock_end_last, y, r);

end
%mean
costpredict2 = mean(sum(costfee,2));

end