       IDENTIFICATION DIVISION.
       PROGRAM-ID. LARGEST-PALINDROME.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
         01 digits      PIC 9(1).
         01 upper_limit PIC 9(18) BINARY.
         01 lower_limit PIC 9(18) BINARY.

         01 i       PIC 9(18) BINARY.
         01 j       PIC 9(18) BINARY.
         01 product PIC 9(18) BINARY.
         01 product_copy PIC 9(18) BINARY.

         01 largest_palindrome PIC 9(18) BINARY VALUE IS ZERO.
         01 reverse_number PIC 9(18) BINARY VALUE IS ZERO.
         01 last_digit     PIC 9 BINARY.

       PROCEDURE DIVISION.
       00-MAIN SECTION.
           ACCEPT digits FROM COMMAND-LINE.
           COMPUTE upper_limit = 10 ** digits.
           COMPUTE lower_limit = 10 ** (digits - 1).
           
           PERFORM 01-A-SELECTOR 
              VARYING i 
              FROM upper_limit
              BY -1
              UNTIL i <= lower_limit.

           DISPLAY largest_palindrome.
           STOP RUN.

       01-A-SELECTOR SECTION.
           PERFORM 02-B-SELECTOR
              VARYING j
              FROM i
              BY -1
              UNTIL j <= lower_limit.
       
       02-B-SELECTOR SECTION.
           MULTIPLY i BY j GIVING product.
           IF product <= largest_palindrome THEN
                   EXIT
           ELSE
                   MOVE product to product_copy
                   MOVE 0 TO reverse_number
                   PERFORM 03-REVERSE-NUMBER UNTIL product_copy = 0
                   IF reverse_number = product THEN
                           MOVE product TO largest_palindrome
                   END-IF
           END-IF.

       03-REVERSE-NUMBER SECTION.
           MOVE product_copy TO last_digit.
           DIVIDE product_copy BY 10 GIVING product_copy.
           COMPUTE reverse_number = reverse_number * 10 + last_digit.

       END PROGRAM LARGEST-PALINDROME.

