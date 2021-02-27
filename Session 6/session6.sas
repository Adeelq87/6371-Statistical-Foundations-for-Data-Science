** Handicap Example below;
libname xl XLSX '/folders/myfolders/statFoundations/session6/session6Data.xlsx';run;
data handicap; set xl.handicap; run;

ods word file="/folders/myfolders/statFoundations/session6/test.docx"; 
proc glm data = handicap order=data;                                                                                                                                                           
class handicap;                                                                                                                                                                                                 
model score = handicap;                                                                                                                                                                                         
means handicap/t bon tukey dunnett ('None') cldiff;
contrast 'is' handicap 0 1 -1 1 -1;
run;
ods word close;

