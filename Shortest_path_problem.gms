*Shortest path problem
*Author: Maocan Song
*Date: 2020-8-9

*index
set i node_id /1*7/;
set origin(i) origin /1/;
set destination(i) /7/;
alias (i,j);
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

parameter origin_node(i)/
1 1
/;
parameter destination_node(i)/
7 1
/;
parameter intermediate_node(i);
intermediate_node(i)=(1-origin_node(i))*(1-destination_node(i));

*model
variable z;
positive variable x(i,j);

equations
obj
flow_balance_origin(i)
flow_balance_destination(i)
flow_balance_otherwise(i)
;
obj..z =e= sum(i,sum(j$cost(i,j),cost(i,j)*x(i,j)));
flow_balance_origin(i)$origin_node(i).. sum(j$cost(i,j),x(i,j)) =e= 1;
flow_balance_destination(i)$destination_node(i)..sum(j$cost(j,i),x(j,i)) =e= 1;
flow_balance_otherwise(i)$(intermediate_node(i)).. sum(j$cost(i,j),x(i,j))-sum(j$cost(j,i),x(j,i)) =e= 0;

Model SPP /all/;
Solve SPP using LP minimizing z;




