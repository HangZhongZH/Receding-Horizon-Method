function [stock_end, costfee] = costfee_oneweek(stock_end_last, y, r)
%Input:
%   'N' is the number of weeks to be evaluated, 
%   'y' is the fixed order number,
%   'r' is the fixed number to decide whether need to order
%Output:
%   'costfee' is the total cost fee of each week

%Called funtion 'stock'
[stock_end, penalty] = stock_oneweek(stock_end_last, y, r);


%was punished by 20 coins/week if short of stock
if penalty == 1
    costfee = 20;
%charge 5 coins/unit/week for warehouse cost
elseif stock_end >= 0
    costfee = stock_end * 5;
end

end



