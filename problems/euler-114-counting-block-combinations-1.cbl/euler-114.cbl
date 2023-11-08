       IDENTIFICATION DIVISION.
       PROGRAM-ID. COUNTING-BLOCKS.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 SOLUTIONS-TABLE.
               05 SOLUTIONS PIC S9(18) BINARY VALUE -1 OCCURS 50 TIMES.

       01 MIN-BLOCK-LENGTH PIC 9(4)  BINARY VALUE IS 3.
       01 ROW-LENGTH       PIC 9(4)  BINARY.
       01 RESULT           PIC 9(18) BINARY.

       PROCEDURE DIVISION.
ACCEPT ROW-LENGTH FROM COMMAND-LINE.
           IF ROW-LENGTH > 50 THEN
                   DISPLAY "COBOL does not do dynamic memory allocation"
                   STOP RUN
           END-IF.

           CALL "COUNTS" USING ROW-LENGTH 
                               MIN-BLOCK-LENGTH
                               SOLUTIONS-TABLE 
                               RETURNING RESULT.

           DISPLAY RESULT.
           STOP RUN.
       END PROGRAM COUNTING-BLOCKS.


       IDENTIFICATION DIVISION.
       PROGRAM-ID. COUNTS IS RECURSIVE.
       DATA DIVISION.
       LOCAL-STORAGE SECTION.
       01 result1   PIC 9(18) BINARY.
       01 result2   PIC 9(18) BINARY.
       01 previous PIC 9(4) BINARY.
       01 cblock   PIC 9(4) BINARY.
       01 cnext    PIC 9(4) BINARY.

       LINKAGE SECTION.
       01 idx       PIC 9(4) BINARY.
       01 minlength PIC 9(4) BINARY.
       01 solutions-tbl.
               05 solutions PIC S9(18) BINARY OCCURS 50 TIMES.

       PROCEDURE DIVISION USING idx minlength solutions-tbl.
       00-handle-recurison.
           IF idx = 0 THEN
                   MOVE 1 TO RETURN-CODE
GOBACK
           END-IF.
         
           IF solutions(idx) >= 0 THEN
                   MOVE solutions(idx) TO RETURN-CODE
GOBACK
           END-IF.

       02-get-cached-results.
           SUBTRACT 1 FROM idx GIVING previous.
           CALL "COUNTS" USING previous minlength solutions-tbl
           RETURNING result1.

       03-calculate.
           PERFORM 04-finding-blocks 
               VARYING cblock
               FROM minlength
               BY 1
               UNTIL cblock > idx.
           
           MOVE result1 TO solutions(idx).
           MOVE result1 TO RETURN-CODE.
GOBACK.

       04-finding-blocks.
           SUBTRACT cblock FROM idx GIVING cnext.
           IF cnext > 0 THEN
               SUBTRACT 1 FROM cnext
           END-IF.

           CALL "COUNTS" USING cnext minlength solutions-tbl
           RETURNING result2.
           ADD result2 TO result1. 

       END PROGRAM COUNTS.
