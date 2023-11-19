// <20% Problem 4

use std::env;

// Define a struct named `PalindromeChecker` to check if a number is a palindrome.
struct PalindromeChecker {}

impl PalindromeChecker {
    // Define a function `is_palindrome` for the `PalindromeChecker` struct that checks if a given number `n` is a palindrome.
    fn is_palindrome(n: u32) -> bool {
        let s = n.to_string(); 
        s.chars().eq(s.chars().rev()) 
    }
}

// Define a struct named `PalindromeFinder` to find the largest palindrome product of two numbers with the specified number of digits.
struct PalindromeFinder {}

impl PalindromeFinder {
    // Define a function `largest_palindrome_product` for the `PalindromeFinder` struct that finds the largest palindrome product of two numbers with the specified number of digits.
    fn largest_palindrome_product(num_digits: u32) -> u32 {
        let start_range = 10u32.pow(num_digits - 1);
        let end_range = 10u32.pow(num_digits) - 1;

        let mut largest_palindrome = 0; // Initialize the variable `largest_palindrome` as 0.

        for i in (start_range..=end_range).rev() {
            for j in (start_range..=i).rev() {
                let product = i * j; // Calculate the product of `i` and `j`.

                if product <= largest_palindrome {
                    break; 
                }

                if PalindromeChecker::is_palindrome(product) {
                    largest_palindrome = product; // Update `largest_palindrome` if the product is a palindrome.
                }
            }
        }

        largest_palindrome 
    }
}

fn main() {
    // Get the number of digits from the command line argument.
    let args: Vec<String> = env::args().collect();

    if args.len() < 2 {
        println!("Please provide the number of digits as a command line argument.");
        return;
    }

    let num_digits: u32 = args[1].parse().expect("Invalid number of digits provided.");
    let largest_palindrome = PalindromeFinder::largest_palindrome_product(num_digits); // Find the largest palindrome product.
    println!( "{}", largest_palindrome);
}
