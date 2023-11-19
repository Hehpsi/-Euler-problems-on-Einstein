// 41%-60% Problem 162
use std::env;

// Define a struct called Calculator
struct Calculator {
    limit: u32,
}

// Implement methods for the Calculator struct
impl Calculator {
    // Define a method to create a new instance of Calculator
    fn new(limit: u32) -> Self {
        Calculator { limit }
    }

    // Define a method to perform a computation and return the result as a hexadecimal string
    fn compute(&self) -> String {
        // Perform a series of calculations and sum the results
        let ans: u64 = (1..=self.limit).map(|n| {
            let term1 = 15u64.wrapping_mul(16u64.pow(n - 1));
            let term2 = 43u64.wrapping_mul(15u64.pow(n - 1));
            let term3 = 41u64.wrapping_mul(14u64.pow(n - 1));
            let term4 = 13u64.pow(n);
            term1.wrapping_sub(term2).wrapping_add(term3).wrapping_sub(term4)
        }).sum();
        // Format the sum as a hexadecimal string and return it
        format!("{:X}", ans)
    }
}

// Define the main function
fn main() {
    // Collect command line arguments into a vector of strings
    let args: Vec<String> = env::args().collect();
    // Check if command line arguments were provided
    if args.len() > 1 {
        // Parse the first argument as an upper limit for the calculation
        let limit: u32 = args[1].parse().expect("Please provide a valid upper limit as a command line argument.");
        // Create a new instance of Calculator with the provided limit
        let calculator = Calculator::new(limit);
        println!("{}", calculator.compute());
    } else {
        // Prompt the user to provide the upper limit as a command line argument
        println!("Please provide the upper limit as a command line argument.");
    }
}

