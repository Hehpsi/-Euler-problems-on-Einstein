       IDENTIFICATION DIVISION.
       PROGRAM-ID. FACTORIAL-TRAILING-DIGITS.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 total    PIC S9(18) USAGE IS COMP-5 VALUE IS ZERO.  
       01 buffer   PIC 9(18) USAGE IS COMP-5 VALUE IS ZERO.  
       01 hex-size PIC 99 BINARY.
       01 n PIC 99 BINARY VALUE IS ZERO.

       01 HEXTABLE VALUE IS "0123456789ABCDEF".
          05 HEXSTR PIC X OCCURS 16 TIMES.
       01 hex-total.
          05 hex-val PIC X OCCURS 16 TIMES VALUE IS "G".
       01 hex-i PIC 9(8) COMP VALUE IS 16.
       01 R PIC 9(8) COMP.

       PROCEDURE DIVISION.
       00-MAIN SECTION.
           ACCEPT hex-size FROM COMMAND-LINE.
           PERFORM 01-MATHS VARYING n FROM 1 BY 1 UNTIL n > hex-size.
           PERFORM 02-HEX-CONVERT.
           PERFORM 03-DISPLAY-HEX.
           STOP RUN.

       01-MATHS SECTION.
           COMPUTE buffer = 15 * (16 ** (n - 1)).
           ADD buffer TO total. 
           COMPUTE buffer = 43 * (15 ** (n - 1)).
           SUBTRACT buffer FROM total. 
           COMPUTE buffer = 41 * (14 ** (n - 1)).
           ADD buffer TO total. 
           COMPUTE buffer = 13 ** n.
           SUBTRACT buffer FROM total. 

       02-HEX-CONVERT SECTION.
           PERFORM UNTIL total EQUAL ZERO
                DIVIDE total BY 16 GIVING total REMAINDER R
                ADD 1 TO R
                MOVE HEXSTR(R) TO hex-val(hex-i)
                SUBTRACT 1 FROM hex-i
           END-PERFORM.

       03-DISPLAY-HEX SECTION.
           PERFORM VARYING hex-i FROM 1 BY 1 UNTIL hex-i > 15 
                   IF hex-val(hex-i) NOT EQUAL 'G' THEN
                           DISPLAY hex-val(hex-i) WITH NO ADVANCING 
                   END-IF
           END-PERFORM.
           DISPLAY hex-val(16). 
       END PROGRAM FACTORIAL-TRAILING-DIGITS.

