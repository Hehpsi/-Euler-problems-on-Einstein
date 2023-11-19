// <20 Problem 3
// Define a struct to encapsulate the functionality of finding the largest prime factor
struct LargestPrime {
    num: u64, // The number for which the largest prime factor will be found
}

impl LargestPrime {
    // Constructor method to create a new instance of LargestPrime
    fn new(num: u64) -> Self {
        LargestPrime { num } // Initialize the struct with the given number
    }

    // Method to find the largest prime factor of the number
    fn find_largest_prime(&self) -> u64 {
        let mut largest: u64 = 0; // Variable to store the largest prime factor found
        let largest_possible = ((self.num as f64).sqrt() + 1.0) as u64; // Calculate the upper limit for the search

        // Iterate through the numbers in reverse order to find the largest prime factor
        for i in (3..largest_possible).rev() {
            if i % 2 == 0 {
                continue; // Skip even numbers as they cannot be prime
            }
            if self.num % i == 0 {
                // If the number is divisible by i, check if i is a prime factor
                let mut is_prime = true; // Assume i is prime unless proven otherwise
                for j in 2..i {
                    if i % j == 0 {
                        is_prime = false; // If i is divisible by any number other than 1 and itself, it's not prime
                        break;
                    }
                }
                if is_prime {
                    largest = i; // If i is prime, it's the largest prime factor
                    break; // Stop the search
                }
            }
        }
        largest // Return the largest prime factor found
    }
}

fn main() {
    let args: Vec<String> = std::env::args().collect(); // Get the command-line arguments
    if args.len() != 2 {
        eprintln!("Usage: cargo run <integer>"); // Print usage message if the number is not provided
        std::process::exit(1); // Exit the program with an error code
    }

    let num: u64 = match args[1].parse() {
        Ok(n) => n, // Parse the input argument as a u64
        Err(_) => {
            eprintln!("Error: Please provide a valid integer."); // Print an error message for invalid input
            std::process::exit(1); // Exit the program with an error code
        }
    };

    let lp = LargestPrime::new(num); // Create a new instance of LargestPrime with the provided number
    let result = lp.find_largest_prime(); // Find the largest prime factor of the number
    println!("{}", result); // Print the largest prime factor
}
