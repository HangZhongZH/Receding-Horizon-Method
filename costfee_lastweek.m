function [costfee, stock_end] = costfee_lastweek(stock_end_last, y, r)

%Input:
%   'stock_end_last' is the stock at the end of last week, 
%   'y' is the order number,
%   'r' is the fixed number (1) to decide whether need to order
%Output:
%   'costfee' is the total cost fee of last week

%Called funtion 'stock'
[stock_end, penalty] = stock_oneweek(stock_end_last, y, r);



%cost in the last week
%Return cost: 10 coins/unit at the last week
if stock_end >= 0
    costfee = stock_end * 10;
elseif penalty == 1
    costfee = 20;
end


end



