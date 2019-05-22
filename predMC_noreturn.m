function [y_best, iforder] = predMC_noreturn(y, h_pred, h_ctrl, MC_num, r, stock_end_last)

%all the combinations
y2 = combvec(y, y, y, y, y, y, y);


costfee = zeros(7 ^ h_ctrl, 1);

%if need re-order
if stock_end_last > r
    iforder = 0;
else
    iforder = 1;
end


for i = 1: size(costfee, 1)

    costfee(i) = costfee_predweeks(stock_end_last, h_pred, h_ctrl, y2(:, i), r, MC_num);
end
[~, idx] = min(costfee);


if iforder == 1
    y_best = y2(1, idx);
    if h_pred == 1 && h_ctrl == 1
    y_best = max(3 - stock_end_last, 0);
    end

else
    y_best = 0;
end

end

