
/*Reading data without using Libname, from SASHELP library */
data baseball;
set sashelp.baseball;
run;
 proc print data = baseball; run;
 proc contents data = baseball; run;

*American East------------------------------------------------------------------------------------------------------------------------------------------------------------------------;
 /*subsetting a dataset using the if...keep and div, delete entries with missing values of salary and check data set*/
 data AEast; set baseball ;
 if div = "AE";
 if salary = ' ' then delete;
 keep Name Team nAtBat nHits nHome nRuns nRBI nBB YrMajor CrAtBat CrHits CrHome CrRuns CrRbi CrBB nOuts nAssts nError div Salary logSalary;
 proc print data = AEast; run;
 proc contents data = AEast; run;
/*Sort data*/
 proc sort data = AEast out = sortAEast;
 by descending salary;
 run;
 proc print data = sortAEast;
 var Name Team Div nAtBat nHits nHome nRuns Salary  ;
 run; 
 proc contents data = sortAEast; run;
 /*Round up salary values with added column and keeping only 8 variables*/
 data sortAEast1; set sortAEast;
 keep Name Team Div nAtBat nHits nHome nRuns Salary_int Total_run ;
 salary_int = round(salary);/*Math function 1:Round*/
 Total_run = nHome + nRuns;/*Added two columns*/
 run;
proc print data = sortAEast1;run;
proc contents data = sortAEast1; run;
/*Added column with div long form, use label to label round up salary as 'Total salary' and Div as 'League and Division'*/
 proc sql;
  select Name, Team, nAtBat label ='Bats in 1986', nHits label = 'Hits in 1986', nHome label ='Home runs in 1986', nRuns label ='Runs in 1986', Total_run label ='Total Runs', Salary_int label = 'Total Salary',
    case Div
	  when 'AE' then 'American East'
	  else 'None'
	end as League label = 'League and Division'
from sortAEast1;

*American west---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------;
data AWest; set baseball ;
 if div = "AW";
 if salary = ' ' then delete;
 keep Name Team nAtBat nHits nHome nRuns nRBI nBB YrMajor CrAtBat CrHits CrHome CrRuns CrRbi CrBB nOuts nAssts nError div Salary logSalary;
 proc print data = AWest; run;
/*Sort data*/
 proc sort data = AWest out = sortAWest;
 by descending salary;
 run;
 proc print data = sortAWest;
 var Name Team Div nAtBat nHits nHome nRuns Salary  ;
 run; 
 proc contents data = sortAWest; run;
 /*Round up salary values with added column and keeping only 8 variables*/
 data sortAWest1; set sortAWest;
 keep Name Team Div nAtBat nHits nHome nRuns Salary_int Total_run ;
 salary_int = round(salary);/*Math function 1:Round*/
 Total_run = nHome + nRuns;/*Added two columns*/
 run;
proc print data = sortAWest1;run;
proc contents data = sortAWest1; run;
/*Added column with div long form, use label to label round up salary as 'Total salary' and Div as 'League and Division'.Here, round is the math function*/
 proc sql;
  select Name, Team, nAtBat label ='Bats in 1986', nHits label = 'Hits in 1986', nHome label ='Home runs in 1986', nRuns label ='Runs in 1986', Total_run label ='Total Runs', Salary_int label = 'Total Salary',
    case Div
	  when 'AW' then 'American West'
	  else 'None'
	end as League label = 'League and Division'
from sortAWest1;

 *National East-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------;
data NEast; set baseball ;
 if div = "NE";
 if salary = ' ' then delete;
 keep Name Team nAtBat nHits nHome nRuns nRBI nBB YrMajor CrAtBat CrHits CrHome CrRuns CrRbi CrBB nOuts nAssts nError div Salary logSalary;
 proc print data = NEast; run;
/*Sort data*/
 proc sort data = NEast out = sortNEast;
 by descending salary;
 run;
 proc print data = sortNEast;
 var Name Team Div nAtBat nHits nHome nRuns Salary  ;
 run; 
 *proc contents data = sortNEast;* run;
 /*Round up salary values with added column and keeping only 8 variables*/
 data sortNEast1; set sortNEast;
 keep Name Team Div nAtBat nHits nHome nRuns Salary_int Total_run ;
 salary_int = round(salary);/*Math function 1:Round*/
 Total_run = nHome + nRuns;/*Added two columns*/
 run;
proc print data = sortNEast1;run;
proc contents data = sortNEast1; run;
/*Added column with div long form, use label to label round up salary as 'Total salary' and Div as 'League and Division'.Here, round is the math function*/
 proc sql;
  select Name, Team, nAtBat label ='Bats in 1986', nHits label = 'Hits in 1986', nHome label ='Home runs in 1986', nRuns label ='Runs in 1986', Total_run label ='Total Runs', Salary_int label = 'Total Salary',
    case Div
	  when 'NE' then 'National East'
	  else 'None'
	end as League label = 'League and Division'
from sortNEast1;


 *National West-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------;
data NWest; set baseball ;
 if div = "NW";
 if salary = ' ' then delete;
 keep Name Team nAtBat nHits nHome nRuns nRBI nBB YrMajor CrAtBat CrHits CrHome CrRuns CrRbi CrBB nOuts nAssts nError div Salary logSalary;
 proc print data = NWest; run;
 /*Sort data*/
 proc sort data = NWest out = sortNWest ;
 by descending salary;
 run;
 proc print data = sortNWest;
 var Name Team Div nAtBat nHits nHome nRuns Salary  ;
 run; 
 proc contents data = sortAWest; run;
 /*Round up salary values with added column and keeping only 8 variables*/
 data sortNWest1; set sortNWest;
 keep Name Team Div nAtBat nHits nHome nRuns Salary_int Total_run ;
 salary_int = round(salary);/*Math function 1:Round*/
 Total_run = nHome + nRuns;/*Added two columns*/
 run;
proc print data = sortNWest1;run;
proc contents data = sortNWest1; run;
/*Added column with div long form, use label to label round up salary as 'Total salary' and Div as 'League and Division'.Here, round is the math function*/
 proc sql;
  select Name, Team, nAtBat label ='Bats in 1986', nHits label = 'Hits in 1986', nHome label ='Home runs in 1986', nRuns label ='Runs in 1986', Total_run label ='Total Runs', Salary_int label = 'Total Salary',
    case Div
	  when 'NW' then 'National West'
	  else 'None'
	end as League label = 'League and Division'
from sortNWest1;

/*Regression analysis using macro */
%macro reg(data=,y=,xs=) ;
proc reg data = &data ;
 model &y = &xs  ;
 run  ;   quit ;
 %mend reg;

%reg(data = sortAEast1 , y = salary_int , xs = total_run)
%reg(data = sortAWest1 , y = salary_int , xs = total_run)
%reg(data = sortNEast1 , y = salary_int , xs = total_run)
%reg(data = sortNWest1 , y = salary_int , xs = total_run)

/*Merge all 4 data sets by div*/
data all; merge  sortAEast1 sortAWest1 sortNEast1 sortNWest1;
by div;
label div = 'Division' nAtBat='Bats in 1986' nHits = 'Hits in 1986' nHome ='Home runs in 1986' nRuns ='Runs in 1986' Total_run ='Total Runs' Salary_int = 'Total Salary';
proc print data = all label; 
run;

/*Univariate by Div*/
proc univariate data = all ;
histogram nAtBat nHIts nHome nRuns Total_run salary_int;
run ;

/*Mean by Div*/
proc means data = all;
var nAtBat nHits nHome nRuns Total_run Salary_int;
by div;
run;

/*Frequency table team by division*/
proc freq data = all;
tables team*div;
run;

/*Scatter plot team vs salary*/
proc sgplot data = all;
vbox salary_int/ category = team;
run;
/*Scatter plot team vs total_run*/
proc sgplot data = all;
vbox total_run/ category = team;
run;

/*Proc report to present result*/
proc report data = all;
title "Final Data";
column Name Team nAtBat nHits nHome Total_run Div Salary_int;
define Name / display width = 5 'Player/Name';
define Team / display 'Team in/1986';
define nAtBat / display 'Bats in /1986';
define nHits / display 'Hits in /1986';
define nHome / display 'Home runs /in 1986';
define Total_run / display 'Total /Runs';
define Div / display 'Division';
define salary_int / display 'Total/Salary';
run;

/*Proc report to present results by grouping team and division*/
proc report data = all;
title "Final Data";
column Name Team nAtBat nHits nHome Total_run Div Salary_int;
define Name / display width = 5 'Player/Name';
define Team / group 'Team in/1986';
define nAtBat / display 'Bats in /1986';
define nHits / display 'Hits in /1986';
define nHome / display 'Home runs /in 1986';
define Total_run / display 'Total /Runs';
define Div / group 'Division';
define salary_int / display 'Total/Salary';
run;
