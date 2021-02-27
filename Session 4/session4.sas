libname xl XLSX '/folders/myfolders/statFoundations/session4/session4Data.xlsx';run;

** cognitive example below;
title "Cognitive example";
data cognitiveData; set xl.cognitive; run; 
title 'Wilcoxon test for Cognitive data';
proc NPAR1WAY data=cognitiveData wilcoxon;
 class treatment;
 var time;
 exact HL;
run;

** creativity example below;
title "Creativity example";
libname xl XLSX '/folders/myfolders/statFoundations/session3/session3Data.xlsx';run;
data creativeData; set xl.creativity; run; 
proc ttest data=creativeData;                                                                                                                                                      
   class group;                                                                                                                                                     
   var score;                                                                                                                                                                       
run;

** Salary example below;
title "Salary example";
libname xl XLSX '/folders/myfolders/statFoundations/session4/session4Data.xlsx';run;
data salaryData; set xl.salary; run; 
title 'two sample t-test and confidence interval salary data';
proc ttest data=salaryData;                                                                                                                                                      
   class gender;                                                                                                                                                     
   var cash;                                                                                                                                                                       
run;

