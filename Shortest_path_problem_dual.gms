*Shortest dual
*date: 2020-8-9

set i /1*7/;
alias(i,j);

*paramenter
parameter cost(i,j)/
1.2 15
1.3 45
1.4 25
2.5 30
2.4 2
3.6 25
4.7 50
4.3 2
5.7 2
6.7 1
/;

variable z;
variables y(i);

equations
obj
optimal_cost(i,j)
;
obj.. z =e= y("7")-y("1");
optimal_cost(i,j)$cost(i,j).. y(j)-y(i) =l= cost(i,j);

model SPP /all/;
solve SPP using LP maximizing z;
