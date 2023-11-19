000100 IDENTIFICATION DIVISION.
000200 PROGRAM-ID. RED-GREEN-AND-BLUE.
000300 DATA DIVISION.
000400 WORKING-STORAGE SECTION.
000500 01 l PIC 999.
000601* This table is the size of 51, because the program does not
000602* expect to deal with input higher than 50
000600 01 CACHED.
000700    05 CACHE PIC 9(18) COMP-5 VALUE 0 OCCURS 51 TIMES.
000800 01 cache-sum PIC 9(18) COMP-5.
000901* Below two are just indexes. They have to have a sign because
000902* because "a - b = z" where "a, b, and z are unsigned"
000903* and "a < b" z would overflow.
000900 01 beg_i PIC S99.
001000 01 end_i PIC S99.
001100 PROCEDURE DIVISION.
001200 00-MAIN SECTION.
001300     ACCEPT l FROM COMMAND-LINE.
001400     IF l > 50 THEN
001500             DISPLAY "COBOL does not do more than 50..."
001600     ELSE
001701* Initialiizing the "CACHE", and adapting the "l"
001700         MOVE 1 TO CACHE(1)
001800         ADD 1 TO l
001901* Equivalent of "for (end_i = 2; end_i <= l; end_i++){...}"
001900         PERFORM VARYING end_i
002000                 FROM 2
002100                 BY 1
002200                 UNTIL end_i > l
002300             PERFORM 01-SUB-PROCEDURE
002400         END-PERFORM
002500     END-IF.
002600     SUBTRACT 1 FROM end_i.
002700     DISPLAY CACHE(end_i).
002800     STOP RUN.
002900 01-SUB-PROCEDURE SECTION.
003000     SUBTRACT 4 FROM end_i GIVING beg_i.
003100     IF beg_i <= 0 THEN
003200             MOVE 1 TO beg_i
003300     END-IF.
003400     PERFORM UNTIL beg_i >= end_i
003500             ADD CACHE(beg_i) TO CACHE(end_i)
003600             ADD 1 TO beg_i
003700     END-PERFORM.
003800 END PROGRAM RED-GREEN-AND-BLUE.

