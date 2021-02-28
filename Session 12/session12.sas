libname xl XLSX '/folders/myfolders/statFoundations/session12/session12Data.xlsx';run;

** RESTAURANT EXAMPLE BELOW USING PROC REG;
data rest; set xl.restaurantSAS; run; 

proc reg data =rest;
 model restSales = pop income/clb clm cli ;
run; 

** RESTAURANT EXAMPLE BELOW USING PROC GLM AND CALCULATING ADJ RSQR;
ods output fitStatistics = fit overallAnova = overallAnova;
ods trace on; *** This shows ods tables in log;
proc glm data =rest plots = diagnostics;
 model restSales = pop income/clparm clm cli ;
run; 
ods output close;
ods trace off;

proc sql; 
 create table dfModel as select df as dfModel from overAllAnova where source = "Model"; run;
proc sql; 
 create table dfTotal as select df as dfTotal from overAllAnova where source = "Corrected Total"; run;

data rsqAdj; merge fit(keep=rsquare) dfModel dfTotal; 
  rsqAdj = 1-(1-rsquare)*(dfTotal/(dftotal -dfModel));
run;

proc print data=rsqAdj; run;

** CHARITY EXAMPLE WITH CATAGORICAL VARIABLE;
libname xl XLSX '/folders/myfolders/statFoundations/session12/session12Data.xlsx';run;
data charity; set xl.charity; 
 if wealth = "RICH" then do;
  indVar1 = 0; indVar0 = 1; 
 end;
 if wealth = "RICHER" then do;
   indVar0 = 0; indVar1 = 1; 
 end;
run; 

title "proc glm charity = wealth";
proc glm data =charity plots = diagnostics;
 class wealth;
 model charity = wealth/clparm  solution;
 lsmeans wealth /cl tdiff diff;
run; 

title "proc glm charity = imp";
proc glm data =charity plots = diagnostics;
 model charity = imp/clparm  solution;
run; 

title "proc glm using class statement with interactions";
proc glm data =charity plots = diagnostics;
 class wealth;
 model charity = wealth imp wealth*imp/clparm  solution;
 lsmeans wealth /cl tdiff diff;
run; 

title "proc glm using indicator variables with interactions";
proc glm data =charity plots = diagnostics;
 class wealth;
 model charity = imp indVar0 indvar1 imp*indVar0 imp*indVar1/clparm solution;
run; 

** HSB EXAMPLE WITH CATAGORICAL VARIABLE;
libname xl XLSX '/folders/myfolders/statFoundations/session12/session12Data.xlsx';run;

data hsb; set xl.hsb; run;

title "proc glm with interactions write, studyHours,SES";
proc glm data =hsb plots = diagnostics;
 class SES;
 model write = studyHours SES studyHours*SES/clparm  solution;
 lsmeans SES /cl tdiff diff;
run; 

ods word file="/folders/myfolders/statFoundations/session12/test.docx";
title "proc glm without write, studyHours,SES";
proc glm data =hsb plots = diagnostics;
 class SES;
 model write = studyHours SES/clparm  solution;
 lsmeans SES /cl tdiff diff;
run; 
ods word close;


