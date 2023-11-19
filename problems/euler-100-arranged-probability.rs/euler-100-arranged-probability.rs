// 20-30% Problem 100

use std::env;

// Define a struct named `DiskCalculator` that represents a disk calculation with blue disks, total disks, and limit.
struct DiskCalculator {
    b: u64, // represents the number of blue disks
    n: u64, // represents the total number of disks
    l: u64, // represents the maximum limit
}

impl DiskCalculator {
    // Define a new function for the DiskCalculator struct that takes parameters b, n, and l, and returns a DiskCalculator instance.
    fn new(b: u64, n: u64, l: u64) -> Self {
        Self { b, n, l }
    }

    // Define a calculate_disk_count method for the DiskCalculator struct that calculates the number of disks.
    fn calculate_disk_count(&mut self) {
        while self.n <= self.l {
            let new_b = 3 * self.b + 2 * self.n - 2;
            let new_n = 4 * self.b + 3 * self.n - 3;
            self.b = new_b;
            self.n = new_n;
        }
    }

    // Define a print_results method for the DiskCalculator struct that prints the calculated results.
    fn print_results(&self) {
        println!("Number of Blue disks = {}", self.b);
    }
}

fn main() {
    // Get the limit from the command line arguments.
    let args: Vec<String> = env::args().collect();

    if args.len() < 2 {
        println!("Please provide the maximum limit as a command line argument.");
        return;
    }

    let limit: u64 = args[1].parse().expect("Invalid limit provided.");

    // Create an instance of DiskCalculator with initial values of 85, 120, and the provided limit.
    let mut disk_calculator = DiskCalculator::new(85, 120, limit);
    disk_calculator.calculate_disk_count();
    disk_calculator.print_results();
}
