// <20% Problem 1
use std::env;

// Define a struct named `SumOfMultiples` that represents the sum of multiples of 3 or 5 below a given limit.
struct SumOfMultiples {
    limit: u32,
}

impl SumOfMultiples {
    // Define a new function for the SumOfMultiples struct that takes a limit parameter and returns a SumOfMultiples instance.
    fn new(limit: u32) -> Self {
        Self { limit }
    }

    // Define a calculate_sum method for the SumOfMultiples struct that calculates and returns the sum of multiples of 3 or 5 below the limit.
    fn calculate_sum(&self) -> u32 {
        let mut sum = 0;

        // Iterate through numbers from 1 to the limit (exclusive).
        for num in 1..self.limit {
            // Check if the number is divisible by 3 or 5.
            if num % 3 == 0 || num % 5 == 0 {
                // If it is, add it to the sum.
                sum += num;
            }
        }

        sum
    }
}

fn main() {
    // Get the limit from the command line arguments.
    let args: Vec<String> = env::args().collect();
    let limit: u32 = args[1].parse().expect("Invalid limit provided.");

    // Create an instance of SumOfMultiples with the provided limit.
    let sum_of_multiples = SumOfMultiples::new(limit);
    let sum = sum_of_multiples.calculate_sum(); 
    println!("{}", sum);
}
