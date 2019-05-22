function [stock_end, penalty] = stock_oneweek(stock_end_last, y, r)

demand = demand_weekly(1);

%to decide whether need to order at the end of last week
if stock_end_last <= r
    %the stock at the begining of this week
    stock_end_last = stock_end_last + y;
else
    stock_end_last = stock_end_last;
end

%the stock at the end of this week
stock_end = stock_end_last - demand;
%whether will be punished this week
if stock_end < 0
    stock_end = 0;
    penalty = 1; 
else
    penalty = 0;
end

    
    