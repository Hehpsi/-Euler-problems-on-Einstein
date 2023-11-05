       IDENTIFICATION DIVISION.
       PROGRAM-ID. MULTIPLES-OF-3-OR-5.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
          01 N     PIC 9(8)  BINARY VALUE ZERO.
          01 num   PIC 9(8)  BINARY VALUE ZERO.
          01 total PIC 9(18) BINARY VALUE ZERO.
              
          01 dump    PIC 9(8) BINARY VALUE ZERO.
          01 residue PIC 9(8) BINARY VALUE ZERO.

       PROCEDURE DIVISION.
       01-PREAMBLE SECTION.
           ACCEPT N FROM COMMAND-LINE.
           SUBTRACT 1 FROM N.
           PERFORM 02-CHECK-RANGE 
                VARYING num 
                FROM 3 
                BY 1 
                UNTIL num > N.
           DISPLAY total.
           STOP RUN.
          
       02-CHECK-RANGE SECTION.
           02-CHECK-IF-DIV-3.
                DIVIDE num BY 3 GIVING dump REMAINDER residue.
                IF residue = 0 THEN
                        ADD num to total
                ELSE
                        PERFORM 02-CHECK-IF-DIV-5
                END-IF.
                GO TO 02-END.
           
           02-CHECK-IF-DIV-5.
                DIVIDE num BY 5 GIVING dump REMAINDER residue.
                IF residue = 0 THEN
                       ADD num to total
                END-IF.

            02-END.
                EXIT.

       END PROGRAM MULTIPLES-OF-3-OR-5.

