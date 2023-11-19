       IDENTIFICATION DIVISION.
       PROGRAM-ID. LARGEST-PRIME-FACTOR.
       DATA DIVISION.
         WORKING-STORAGE SECTION.
          01 n        PIC 9(18) BINARY.
          01 divisor  PIC 9(8)  BINARY VALUE 2.
            
          01 dump     PIC 9(1)  BINARY VALUE 0.
          01 residue  PIC 9(8)  BINARY VALUE 0.

       PROCEDURE DIVISION.
         0000-preamble.
            ACCEPT n FROM COMMAND-LINE.
    
         0001-n-not-1-loopback.
            IF n EQUAL 1 THEN
                 GO TO 0002-n-not-1-loop-out.

         0002-division-check-loopback.
            DIVIDE n BY divisor GIVING dump REMAINDER residue.
            IF residue NOT EQUAL 0
                GO TO 0011-division-check-out.
            
            DIVIDE n BY divisor GIVING n.
            
            GO TO 0002-division-check-loopback.

         0011-division-check-out.
            ADD 1 TO divisor. 
            GO TO 0001-n-not-1-loopback.
        
        
         0002-n-not-1-loop-out.
            SUBTRACT 1 FROM divisor.
            DISPLAY divisor.
         
            STOP RUN.
       END PROGRAM LARGEST-PRIME-FACTOR.
