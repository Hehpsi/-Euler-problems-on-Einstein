       IDENTIFICATION DIVISION.
       PROGRAM-ID. PRIME-SUM.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
         01 num                  PIC 9(8)  BINARY.
         01 n                    PIC 9(8)  BINARY.
         01 total                PIC 9(16) BINARY VALUE IS ZERO.

         01 is-prime-remainder   PIC 9(8)  BINARY VALUE IS ZERO.
         01 is-prime-dump        PIC 9     BINARY VALUE IS ZERO.
           
         01 prime-squeaze-lowd   PIC 9(8)  BINARY VALUE IS ZERO.
         01 prime-squeaze-end    PIC 9(8)  BINARY VALUE IS ZERO.
         01 prime-squeaze-mid    PIC 9(8)  BINARY VALUE IS ZERO.
         01 prime-squeaze-pow    PIC 9(16) BINARY VALUE IS ZERO.
         01 prime-squeaze-end-l  PIC 9(8)  BINARY VALUE IS ZERO.
            
       PROCEDURE DIVISION.
        00-MAIN SECTION.
          00-PREAMBLE.
            ACCEPT n FROM COMMAND-LINE.

            IF n <= 0 THEN
               DISPLAY total
               STOP RUN
            ELSE
               MOVE 2 TO total
            END-IF.

            MOVE n TO prime-squeaze-end.
            PERFORM 01-IS-PRIME 
                VARYING num
                FROM n
                BY -1
                UNTIL num <= 2.

            DISPLAY total.
            STOP RUN.
        
        
        
         01-IS-PRIME SECTION.
          01-IS-PRIME-PREAMBLE.
            MOVE prime-squeaze-end-l TO prime-squeaze-end.
            PERFORM 02-PRIME-SQUEAZE.
            MOVE prime-squeaze-lowd TO prime-squeaze-end-l.
          
          01-IS-PRIME-LOOP.
            IF prime-squeaze-lowd <= 1 THEN
                ADD num TO total
            ELSE
                DIVIDE num BY prime-squeaze-lowd
                    GIVING is-prime-dump 
                    REMAINDER is-prime-remainder
                IF is-prime-remainder > 0 THEN
                    SUBTRACT 1 FROM prime-squeaze-lowd
                    GO TO 01-IS-PRIME-LOOP
                END-IF
            END-IF.
            
          
        
        02-PRIME-SQUEAZE SECTION.
          02-PRIME-SQUEAZE-PREAMBLE.
            MOVE prime-squeaze-end TO prime-squeaze-mid.
            DIVIDE prime-squeaze-mid BY 2 GIVING prime-squeaze-mid.
            
           MULTIPLY prime-squeaze-mid BY prime-squeaze-mid
                GIVING prime-squeaze-pow.
            
            IF prime-squeaze-pow > num THEN
              MOVE prime-squeaze-mid TO prime-squeaze-end
              PERFORM 02-PRIME-SQUEAZE-PREAMBLE
            ELSE
              PERFORM 02-PRIME-SQUEAZE-FINE-TUNE 
                    UNTIL prime-squeaze-pow > num
              MOVE prime-squeaze-mid TO prime-squeaze-lowd
              SUBTRACT 1 FROM prime-squeaze-lowd
     
              IF prime-squeaze-lowd < 2 THEN
                  MOVE 2 TO prime-squeaze-lowd
              END-IF
            END-IF.
            
            EXIT.
  
          02-PRIME-SQUEAZE-FINE-TUNE.
            ADD 1 TO prime-squeaze-mid.
            MULTIPLY prime-squeaze-mid BY prime-squeaze-mid
                GIVING prime-squeaze-pow.
            
  
END PROGRAM PRIME-SUM.

