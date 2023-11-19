       IDENTIFICATION DIVISION.
       PROGRAM-ID. RED-GREEN-AND-BLUE.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 l PIC 999.
       01 CACHED.
               05 CACHE PIC 9(18) COMP-5 VALUE 0 OCCURS 51 TIMES.
       01 cache-sum PIC 9(18) COMP-5.
       01 beg_i PIC S99.
       01 end_i PIC S99.

       PROCEDURE DIVISION.
       00-MAIN SECTION.
           ACCEPT l FROM COMMAND-LINE.

           IF l > 50 THEN
                   DISPLAY "COBOL does not do more than 50..."
           ELSE
               MOVE 1 TO CACHE(1)
               ADD 1 TO l
               PERFORM VARYING end_i
                       FROM 2
                       BY 1
                       UNTIL end_i > l
                   PERFORM 01-SUB-PROCEDURE
               END-PERFORM
           END-IF.
           SUBTRACT 1 FROM end_i.
           DISPLAY CACHE(end_i).
           STOP RUN.

       01-SUB-PROCEDURE SECTION.
           SUBTRACT 4 FROM end_i GIVING beg_i.
           
           IF beg_i <= 0 THEN
                   MOVE 1 TO beg_i
           END-IF.
           PERFORM UNTIL beg_i >= end_i
                   ADD CACHE(beg_i) TO CACHE(end_i)
                   ADD 1 TO beg_i
           END-PERFORM.
           
       END PROGRAM RED-GREEN-AND-BLUE.
