*TSP dual
*date: 2020-8-10

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
parameter task_node(i)/
2 1
5 1
/;
parameter non_task_node(i)/
1 1
2 0
3 1
4 1
5 0
6 1
7 1
/;

variable z;
variables
y(i)
W(i)
;

equations
obj
optimal_cost(i,j)
optimal_cost_1(i,j)
;
obj.. z =e= y("7")-y("1")-sum(i$(task_node(i)),w(i));
optimal_cost(i,j)$(cost(i,j) and task_node(i)).. y(j)-y(i)-w(i) =l= cost(i,j);
optimal_cost_1(i,j)$(cost(i,j) and non_task_node(i)).. y(j)-y(i) =l= cost(i,j);

model TSP /all/;
solve TSP using LP maximizing z;
