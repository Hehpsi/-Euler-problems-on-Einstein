       IDENTIFICATION DIVISION.
       PROGRAM-ID. COIN-PARTITIONS.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 MODULUS PIC 9(8) COMP-4.

       01 CACHED-SOLUTIONS.
           05 SOLUTION-CACHE PIC S9(8) COMP-4
               VALUE ZERO OCCURS 100000 TIMES.

       01 PENTAGONALS-CACHE-SIZE PIC 9(8) COMP-4 VALUE IS 0.
       01 CACHED-PENTAGONALS.
           05 PENTAGONALS-CACHE PIC S9(8) COMP-4
               VALUE ZERO OCCURS 1000 TIMES.

       01 static-n  PIC 9(8) COMP-4 VALUE IS 999999. 
       01 n-true    PIC 9(8) COMP-4 VALUE IS 1. 
       01 n-adapt   PIC 9(8) COMP-4 VALUE IS 1. 
       01 n1     PIC 9(8) COMP-4 VALUE IS 1. 
       01 g      PIC 9(8) COMP-4 VALUE IS 1. 
       01 buff   PIC S9(8) COMP-4 VALUE IS 1. 
       01 sgn    PIC S9          VALUE IS 1. 
       01 i      PIC 9(8) COMP-4 VALUE IS 1. 
       01 ix     PIC 9(8) COMP-4 VALUE IS 1. 
       01 ix1     PIC 9(8) COMP-4 VALUE IS 1. 

       PROCEDURE DIVISION.
       00-MAIN SECTION.
           ACCEPT MODULUS FROM COMMAND-LINE.
           MOVE 1 TO SOLUTION-CACHE(1).

           CALL "PENTAGONAL" USING 
                BY REFERENCE CACHED-PENTAGONALS 
                             static-n
                             PENTAGONALS-CACHE-SIZE.

           INITIALIZE CACHED-SOLUTIONS.
           MOVE 0 TO n-true.
           ADD 1 TO n-true GIVING n-adapt.
           MOVE 1 TO SOLUTION-CACHE(n-adapt).
       
           PERFORM 01-CALC UNTIL SOLUTION-CACHE(n-adapt) EQUAL ZERO.
           DISPLAY n-true.
           STOP RUN.

       01-CALC SECTION.
       01-main.
           MOVE 0 TO g.
           ADD 1 TO n-true.
           ADD 1 TO n-true GIVING n-adapt.

           MOVE 0 TO SOLUTION-CACHE(n-adapt).

           PERFORM VARYING i FROM 1 BY 1 UNTIL g > n-true
                   PERFORM 01-retrieve-sgn-and-g
                   IF g <= n-true THEN
                      PERFORM 01-crunch-numbers
                   END-IF
           END-PERFORM. 
           GO TO 01-end.

       01-retrieve-sgn-and-g.
           MOVE PENTAGONALS-CACHE(i) TO g.
           MOVE 1 TO sgn.
           IF PENTAGONALS-CACHE(i) < 0 THEN
                   MOVE -1 TO sgn
           END-IF.

       01-crunch-numbers.
           COMPUTE ix = n-true - g.
           ADD 1 TO ix GIVING ix1.
           COMPUTE buff = sgn * SOLUTION-CACHE(ix1).
           ADD buff TO SOLUTION-CACHE(n-adapt).
           DIVIDE SOLUTION-CACHE(n-adapt) BY MODULUS 
           GIVING buff REMAINDER SOLUTION-CACHE(n-adapt).

       01-end.
           EXIT.

       02-TEST SECTION.
           PERFORM VARYING ix FROM 1 BY 1 
                   UNTIL ix > PENTAGONALS-CACHE-SIZE 
               DISPLAY PENTAGONALS-CACHE(ix)
           END-PERFORM.
       END PROGRAM COIN-PARTITIONS.





       IDENTIFICATION DIVISION.
       PROGRAM-ID. PENTAGONAL.
       DATA DIVISION.
       LOCAL-STORAGE SECTION.
       01 a     PIC 9(18) COMP-5 VALUE IS 1.
       01 b     PIC 9(18) COMP-5 VALUE IS 2.
       01 delta PIC 9(18) COMP-5 VALUE IS 4.
       01 sgn   PIC S9           VALUE IS 1.
       01 i     PIC 9(8)  COMP-4 VALUE IS 1.
       LINKAGE SECTION.
       01 pentagonals-cache.
           05 pentagonals PIC S9(8) COMP-4
               OCCURS 1000 TIMES.
       01 n PIC 9(8) COMP-4.
       01 len PIC 9(8) COMP-4.
       PROCEDURE DIVISION USING BY REFERENCE pentagonals-cache n len.
       00-MAIN SECTION.
           PERFORM 01-GEN-PENTAGONAL UNTIL a > n.
           MOVE i TO len.
           GOBACK.

       01-GEN-PENTAGONAL SECTION.
           COMPUTE pentagonals(i) = sgn * a.
           ADD delta TO a.
   
           IF b <= n THEN
                   ADD 1 TO i
                   COMPUTE pentagonals(i) = sgn * b
                   COMPUTE b = b + delta + 1
           END-IF.

           ADD 3 TO delta.
           COMPUTE sgn = sgn * -1.
           
           ADD 1 TO i.

       END PROGRAM PENTAGONAL.

