** archeology Example below;
libname xl XLSX '/folders/myfolders/statFoundations/session5/session5Data.xlsx';run;
data archeology; set xl.archeology; run;

/* Generates Box-plot */
title "Box-plot using archeology Data";  
PROC SGPLOT  DATA = archeology;
   VBOX score / category = group;
RUN;                                                                                                                                                                                                   
                                                                                                                                                                                                             
/* Generates QQ-plot and histograms*/                                                                                                                                                                                      
proc univariate data = archeology;                                                                                                                                                    
by site;                                                                                                                                                                                                    
var depth; 
histogram depth;                                                                                                                                                                                                   
qqplot/normal(mu=est sigma=est color=red l=2);                                                                                                                                                            
run;                                                                                                                                                                                                         
                                                                                                                                                                                                             
/* Generates Scatterplot */                                                                                                                                                                                  
proc sgplot data=archeology;                                                                                                                                                          
scatter x=site y=depth;                                                                                                                                                                                        
run;  
                                                                                                                                                                                                       
proc glm data = archeology;                                                                                                                                                           
class site;                                                                                                                                                                                                 
model depth = site; 
means site / HOVTEST = BF t;                                                                                                                                                                                        
run; 

** UNEQUAL SD EXAMPLE BELOW;
libname xl XLSX '/folders/myfolders/statFoundations/session5/session5Data.xlsx';run;
data unequalSd; set xl.unequalSDExample; logScore = log(score);run;

proc sort data = unequalSd;                                                                                                                                                          
by Group;                                                                                                                                                                                                    
run;    

ods word file="/folders/myfolders/statFoundations/session5/test.docx";  

/* Generates Box-plot */
title "Box-plot using unequalSD Data";  
PROC SGPLOT  DATA = unequalSd;
   VBOX score / category = group;
RUN;                                                                                                                                                                                                   
                                                                                                                                                                                                             
/* Generates QQ-plot and histogram*/                                                                                                                                                                                      
proc univariate data = unequalSd;                                                                                                                                                    
by Group;                                                                                                                                                                                                    
var Score;                                                                                                                                                                                                   
qqplot / normal(mu=est sigma=est color=red l=2);
histogram Score;                                                                                                                                                             
run;                                                                                                                                                                                                         
                                                                                                                                                                                                             
/* Generates Scatterplot with log*/ 
proc sgplot data=unequalSd;                                                                                                                                                          
scatter x=xs y=logScore;                                                                                                                                                                                        
run;  
ods word close;

proc glm data = unequalSd;                                                                                                                                                           
 class Group;                                                                                                                                                                                                 
 model Score = Group;                                                                                                                                                                                       
 means Group / HOVTEST = BF Welch t ;                                                                                                                                                                            
run;    

proc npar1way data =unequalsd ;
 class Group;                                                                                                                                                                                                 
 var Score;
run; 

ods word file="/folders/myfolders/statFoundations/session5/test.docx";
proc ttest data=unequalsd(where =(group = "A" or group ="B"));                                                                                                                                                    
   class group; var score;  run;                                                                                                                             
  
proc ttest data=unequalsd(where =(group = "A" or group ="C"));                                                                                                                                                    
   class group; var score;  run;
   
proc ttest data=unequalsd(where =(group = "B" or group ="C"));                                                                                                                                                    
   class group; var score;  run;
ods word close;   

