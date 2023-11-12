       IDENTIFICATION DIVISION.
       PROGRAM-ID. PRIME-DIGITS.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 n         PIC 9(18) COMP-5.

       01 factor5   PIC 9(5)  COMP-4.
       01 twos      PIC 9(18) COMP-5.
       01 mod-pow-2 PIC 9(5)  COMP-4 VALUE IS 2.

       01 buff1     PIC 9(18) COMP-5.
       01 buff2     PIC 9(18) COMP-5.
           
       01 CF-end    PIC 9(18) COMP-5.
       01 CF-n      PIC 9(18) COMP-5.
       PROCEDURE DIVISION.
       00-MAIN SECTION.
           ACCEPT n FROM COMMAND-LINE.
           PERFORM 01-THE-SNEAKY-TWOS-OPTIMIZATION.

           PERFORM 03-MODULATED-POWER-OF-TWO.
           CALL "FACTORIALISH" USING BY VALUE n RETURNING factor5.
           MULTIPLY factor5 BY mod-pow-2 GIVING factor5.
           DISPLAY factor5.

           STOP RUN.

       01-THE-SNEAKY-TWOS-OPTIMIZATION SECTION.
           MOVE 2 TO CF-n.
           PERFORM 02-COUNT-FACTORS.
           MOVE buff1 TO twos.

           MOVE 5 TO CF-n.
           PERFORM 02-COUNT-FACTORS.
           SUBTRACT buff1 FROM twos.

           IF twos >= 2505 THEN
               SUBTRACT 5 FROM twos
               DIVIDE twos BY 2500 GIVING buff1 REMAINDER twos
               ADD 5 TO twos
           END-IF.

       02-COUNT-FACTORS SECTION.
           MOVE n TO CF-end.
           MOVE 0 TO buff1.
           PERFORM UNTIL CF-end = 0
               DIVIDE CF-end BY CF-n GIVING CF-end
               ADD CF-end TO buff1
           END-PERFORM.

       03-MODULATED-POWER-OF-TWO SECTION.
           SUBTRACT 1 FROM twos.
           PERFORM twos TIMES
               ADD mod-pow-2 TO mod-pow-2
           END-PERFORM.
       END PROGRAM PRIME-DIGITS.


       IDENTIFICATION DIVISION.
       PROGRAM-ID. ODD-FACTORIALISH IS RECURSIVE.
       DATA DIVISION.
       LOCAL-STORAGE SECTION.
       01 new-n   PIC 9(18) COMP-5.
       01 n-cut   PIC 9(5)  COMP-4.
       01 i       PIC 9(5)  COMP-4.
       01 product PIC 9(5)  COMP-4 VALUE IS 1.
       01 dump    PIC 9(5)  COMP-4.
       01 check-5 PIC 9.
       01 check-2 PIC 9.
       01 rec-result PIC 9(5) COMP-4.
       LINKAGE SECTION.
       01 n PIC 9(18) COMP-5.
       PROCEDURE DIVISION USING BY VALUE n.
       00-MAIN SECTION.
           IF n = 0 THEN
                   MOVE 1 TO RETURN-CODE
GOBACK
           END-IF.

           DIVIDE n BY 5 GIVING new-n.
           CALL "ODD-FACTORIALISH"
                USING BY VALUE new-n 
                RETURNING rec-result.

           PERFORM 01-FIND-COPRIMES.
           
           MULTIPLY rec-result BY product GIVING rec-result.
           MOVE rec-result TO RETURN-CODE.
GOBACK.

       01-FIND-COPRIMES SECTION.
           MOVE n TO n-cut.
           PERFORM VARYING i FROM 1 BY 1 UNTIL i > n-cut
              DIVIDE i BY 2 GIVING dump REMAINDER check-2
              DIVIDE i BY 5 GIVING dump REMAINDER check-5

              IF check-2 > 0 AND check-5 > 0 THEN
                 MULTIPLY product BY i GIVING product
              END-IF 
           END-PERFORM. 
       END PROGRAM ODD-FACTORIALISH.



       IDENTIFICATION DIVISION.
       PROGRAM-ID. FACTORIALISH IS RECURSIVE.
       DATA DIVISION.
       LOCAL-STORAGE SECTION.
       01 rec-result PIC 9(5) COMP-4.
       01 new-n   PIC 9(18)  COMP-5.
       01 odd  PIC 9(5) COMP-4.
       LINKAGE SECTION.
       01 n PIC 9(18) COMP-5.
       PROCEDURE DIVISION USING BY VALUE n.
           CALL "ODD-FACTORIALISH"
                USING BY VALUE n 
                RETURNING odd.

           IF n = 0 THEN
                   MOVE odd TO RETURN-CODE
GOBACK
           END-IF.

           DIVIDE n BY 2 GIVING new-n.
           CALL "FACTORIALISH"
                USING BY VALUE new-n
                RETURNING rec-result. 

           MULTIPLY rec-result BY odd GIVING rec-result.
           MOVE rec-result TO RETURN-CODE.

       END PROGRAM FACTORIALISH.
