data temp;
input SMU SeattleU;
datalines;
34 20
1200 10
23 5
50 0
60 30
50 50
0 0
0 100
30 110
89 0
0 40
300 10
400 3
20 0
10
0
;
run;

title "Distribution of SMU";
proc univariate data=temp;
histogram SMU;
run;

title "Distribution of Seattle U";
proc univariate data=temp;
histogram SeattleU;
run;
