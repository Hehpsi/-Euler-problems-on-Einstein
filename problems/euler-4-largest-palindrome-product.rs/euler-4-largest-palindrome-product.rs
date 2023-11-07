use std::env;

// <20% Problem 4
// Function to check if a given number is a palindrome
fn is_palindrome(n: u32) -> bool {
    // Convert the number to a string for easier comparison
    let s = n.to_string();
    // Check if the characters in the string are equal when reversed
    s.chars().eq(s.chars().rev())
}

// Function to find the largest palindrome product of two 3-digit numbers
fn largest_palindrome_product() -> u32 {
    let args: Vec<String> = env::args().collect();
    let digits : u32 = match (&args[1]).parse::<u32>() {
        Ok(i) => i,
        Err(_) => {
            eprintln!("Invalid Input");
            0
        }
    };

    let base10 : u32 = 10;
    let top = base10.pow(digits);
    let bottom = base10.pow(digits-1);

    let mut largest_palindrome = 0;
    // Iterate through all 3-digit numbers in descending order
    for i in (bottom..top).rev() {
        for j in (bottom..=i).rev() {
            let product = i * j;
            
            // If the product is less than or equal to the current largest palindrome, break the inner loop
            if product <= largest_palindrome {
                break;
            }

            // Check if the product is a palindrome
            if is_palindrome(product) {
                largest_palindrome = product; // Update the largest palindrome if found
            }
        }
    }

    largest_palindrome
}

fn main() {
    // Find the largest palindrome product and store it in largest_palindrome
    let largest_palindrome = largest_palindrome_product();
    // Print the result to the console
    println!("{}", largest_palindrome);
}

