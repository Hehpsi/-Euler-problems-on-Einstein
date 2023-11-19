// <20% Problem 10

use std::env;

struct PrimeCalculator {
    total: u64,
}

impl PrimeCalculator {
    // Create a new instance of PrimeCalculator with the total initialized to 0
    fn new() -> Self {
        Self { total: 0 }
    }

    // Check if a number is prime
    fn is_prime(&self, n: u64) -> bool {
        if n == 2 {
            return true;
        }

        if n < 2 {
            return false;
        }

        if n % 2 == 0 {
            return false;
        }

        let mut i = 3;
        while i * i <= n {
            if n % i == 0 {
                return false;
            }
            i += 2;
        }

        true
    }

    // Calculate the sum of prime numbers up to a given range
    fn calculate_sum(&mut self, range: u64) {
        let mut i: u64 = 1;

        while i < range {
            if self.is_prime(i) {
                self.total += i;
            }
            i += 1;
        }
    }

    // Print the sum of prime numbers
    fn print_sum(&self) {
        println!("{}", self.total);
    }
}

fn main() {
    // Get the range from the command line arguments.
    let args: Vec<String> = env::args().collect();

    if args.len() < 2 {
        println!("Please provide the range as a command line argument.");
        return;
    }

    let range: u64 = args[1].parse().expect("Invalid range provided.");
    let mut prime_calculator = PrimeCalculator::new();
    prime_calculator.calculate_sum(range); // Calculate the sum of prime numbers up to the given range
    prime_calculator.print_sum();          
}


  