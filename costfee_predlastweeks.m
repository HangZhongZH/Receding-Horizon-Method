function  costfee_predtotal = costfee_predlastweeks(stock_end_last, h_pred, h_ctrl, y, r, MCnum)

%Monte Carlo simulations
for i = 1: MCnum
    stock_end_last2 = stock_end_last;
    for j = 1: h_pred
        %input number limited by control horizon
        if j <= h_ctrl
            y1 = y(j);
        else
            y1 = y(h_ctrl);
        end
        %include last week
        [costfee, stock_end] = costfee_lastweek(stock_end_last2, y1, r);
        costfee_predtotal(i, j) = costfee;
        stock_end_last2 = stock_end;
    end
end
%mean
costfee_predtotal = mean(sum(costfee_predtotal, 2));

end
