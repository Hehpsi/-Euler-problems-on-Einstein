// 41%-60% Problem 160

use std::env;

// Define a struct called FactorialSuffix
struct FactorialSuffix;

// Implement methods for the FactorialSuffix struct
impl FactorialSuffix {
    // Define a method to create a new instance of FactorialSuffix
    fn new() -> Self {
        FactorialSuffix
    }

    // Define a method to run the computation and return the result
    fn run(&self, n: u64) -> u64 {
        // Calculate the number of twos and adjust if necessary
        let twos = self.count_factors(n, 2) - self.count_factors(n, 5);
        let mut twos = if twos >= 2505 {
            (twos - 5) % 2500 + 5
        } else {
            twos
        };
        // Calculate t and f, then return the final result
        let t = self.pow_mod(2, twos, 100000);
        let f = self.factorialish(n);
        (f * t) % 100000
    }

    // Define a method to compute the result for a given input
    fn compute(&self, n: u64) -> u64 {
        self.run(n)
    }

    // Define a method to calculate the factorialish value of n
    fn factorialish(&self, n: u64) -> u64 {
        if n == 0 {
            self.odd_factorialish(n) % 100000
        } else {
            self.factorialish(n / 2) * self.odd_factorialish(n) % 100000
        }
    }

    // Define a method to calculate the odd factorialish value of n
    fn odd_factorialish(&self, n: u64) -> u64 {
        if n == 0 {
            1
        } else {
            self.odd_factorialish(n / 5) * self.factorial_coprime(n) % 100000
        }
    }

    // Define a method to calculate the even factorialish value of n
    fn even_factorialish(&self, n: u64) -> u64 {
        if n == 0 {
            1
        } else {
            self.factorialish(n / 2)
        }
    }

    // Define a method to calculate the factorial coprime value of n
    fn factorial_coprime(&self, n: u64) -> u64 {
        let n = n % 100000;
        let mut product = 1;
        for i in 1..=n {
            if i % 2 != 0 && i % 5 != 0 {
                product = (i * product) % 100000;
            }
        }
        product
    }

    // Define a method to count the factors of a number
    fn count_factors(&self, end: u64, n: u64) -> u64 {
        if end == 0 {
            0
        } else {
            end / n + self.count_factors(end / n, n)
        }
    }

    // Define a method to calculate the modular exponentiation
    fn pow_mod(&self, base: u64, exponent: u64, modulus: u64) -> u64 {
        if modulus == 1 {
            return 0;
        }
        let mut result = 1;
        let mut base = base % modulus;

        let mut exponent = exponent;
        while exponent > 0 {
            if exponent % 2 == 1 {
                result = (result * base) % modulus;
            }
            exponent = exponent >> 1;
            base = (base * base) % modulus;
        }
        result
    }
}

// Define the main function
fn main() {
    // Collect command line arguments into a vector of strings
    let args: Vec<String> = env::args().collect();
    // Parse the first argument as the input value for the computation
    let n: u64 = args[1].parse().unwrap();
    // Create a new instance of FactorialSuffix
    let factorial_suffix = FactorialSuffix::new();
    // Perform the computation and print the result
    let ans = factorial_suffix.run(n);
    println!("{}", ans);
}
