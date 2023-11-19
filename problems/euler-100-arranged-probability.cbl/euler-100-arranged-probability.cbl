       IDENTIFICATION DIVISION.
       PROGRAM-ID. ARRANGED-PROB.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
         01 b     PIC 9(18) BINARY VALUE IS 85.
         01 n     PIC 9(18) BINARY VALUE IS 120.
         01 l     PIC 9(18) BINARY VALUE IS 1000000000000.

         01 buff1 PIC 9(18) BINARY VALUE IS ZERO.
         01 buff2 PIC 9(18) BINARY VALUE IS ZERO.
       
       PROCEDURE DIVISION.
       00-MAIN SECTION.
           ACCEPT l FROM COMMAND-LINE.
           IF n < l THEN
                PERFORM 01-EVAL UNTIL n > l
           END-IF.
           DISPLAY b.

       01-EVAL SECTION.
           MULTIPLY b BY 3 GIVING buff1.
           MULTIPLY n BY 2 GIVING buff2.
           ADD buff1 TO buff2.
           SUBTRACT 2 FROM buff2.

           MULTIPLY b BY 4 GIVING buff1.
           MOVE buff2 TO b.
           MULTIPLY n BY 3 GIVING buff2.
           ADD buff1 TO buff2 GIVING n.
           SUBTRACT 3 FROM n.

       END PROGRAM ARRANGED-PROB.

