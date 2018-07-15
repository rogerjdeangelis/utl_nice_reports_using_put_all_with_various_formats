Very nice reports using put all with various formats

This is really good stuff!!

see SAS Forum
https://tinyurl.com/yavopecv
https://communities.sas.com/t5/Base-SAS-Programming/How-do-I-select-a-customer-with-a-pattern-in-Score-using-Macro/m-p/478186

K Sharp profile
https://communities.sas.com/t5/user/viewprofilepage/user-id/18408

  Except for algorithm 3 WPS gave the same results
  I wish WPS would support the SAS classic editor
  Cuth macro on end (you could put it on a function key or mouse action.
  Entire macro fits on a function key

  Four Methods inspired by K Sharp

     1. put (_all_) (:)
     2. put (_all_) ($8.)  (without cuth command macro)
     3. put (_all_) ($8.)  (with cuth command macro - on end)
     4. put name $8. (sex-weight) ($4.)


INPUT
=====
  sashelp.class

EXAMPLE OUTPUTS
---------------

1. put (_all_) (:)

 Alfred M 14 69 112.5
 Alice F 13 56.5 84
 Barbara F 13 65.3 98
 Carol F 14 62.8 102.5
 Henry M 14 63.5 102.5
 James M 12 57.3 83
 Jane F 12 59.8 84.5

2. put (_all_) ($8.)
  (fixed columns of length 8 - may not display correctly due to proporional font)

 Alfred  M             14      69     113
 Alice   F             13      57      84
 Barbara F             13      65      98
 Carol   F             14      63     103
 Henry   M             14      64     103
 James   M             12      57      83
 Jane    F             12      60      85
 Janet   F             15      63     113

3. put (_all_) ($8.)  (with cuth command macro)

  Highlighting sex--weight execute command macro 'cuth'

 Alfred  M 14 69 113
 Alice   F 13 57 84
 Barbara F 13 65 98
 Carol   F 14 63 103
 Henry   M 14 64 103
 James   M 12 57 83


4. put name $8. (sex-weight) ($4.)

 Alfred  M     14  69 113
 Alice   F     13  57  84
 Barbara F     13  65  98
 Carol   F     14  63 103
 Henry   M     14  64 103
 James   M     12  57  83


PROCESS
=======

1. put (_all_) (:)

   data _null_;
   set sashelp.class;
   put (_all_) (:);
   run;quit;

2. put (_all_) ($8.)

   data _null_;
   set sashelp.class;
   put (_all_) ($8.);
   run;quit;

3. put (_all_) ($8.)  (with cuth command macro)

   Highlighting sex--weight execute command macro 'cuth'

4. put name $8. (sex-weight) ($4.)

   data _null_;
   set sashelp.class;
   put name $8. (sex--weight) ($4.);
   run;quit;

OUTPUT
======

  see eample output aove

*                _               _       _
 _ __ ___   __ _| | _____     __| | __ _| |_ __ _
| '_ ` _ \ / _` | |/ / _ \   / _` |/ _` | __/ _` |
| | | | | | (_| |   <  __/  | (_| | (_| | || (_| |
|_| |_| |_|\__,_|_|\_\___|   \__,_|\__,_|\__\__,_|

;
   just use sashelp.class

*          _       _   _
 ___  ___ | |_   _| |_(_) ___  _ __  ___
/ __|/ _ \| | | | | __| |/ _ \| '_ \/ __|
\__ \ (_) | | |_| | |_| | (_) | | | \__ \
|___/\___/|_|\__,_|\__|_|\___/|_| |_|___/

;
%utl_submit_wps64('
libname hlp  sas7bdat "C:\Progra~1\SASHome\SASFoundation\9.4\core\sashelp";
   data _null_;
   set hlp.class;
   put (_all_) (:);
   run;quit;

   data _null_;
   set hlp.class;
   put (_all_) ($8.);
   run;quit;

   data _null_;
   set hlp.class;
   put name $8. (sex--weight) ($4.);
   run;quit;
run;quit;
');

*
 _ __ ___   __ _  ___ _ __ ___
| '_ ` _ \ / _` |/ __| '__/ _ \
| | | | | | (_| | (__| | | (_) |
|_| |_| |_|\__,_|\___|_|  \___/

;

%macro cuth/cmd;
  %do i=1 %to 20;
    c '  ' ' ' all;
  %end;
%mend cuth;



