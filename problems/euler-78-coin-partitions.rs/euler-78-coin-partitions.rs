// 20-30% Problem 78

use std::env;

// Define a struct named PartitionCal that represents a partition calculator.
struct PartitionCal {
    modulus: i32,           
    partition: Vec<i32>,    
}

impl PartitionCal {
    // Define a new function for the PartitionCal struct that creates a new instance of PartitionCal.
    fn new(modulus: i32) -> Self {
        Self {
            modulus,
            partition: vec![0; modulus as usize], 
        }
    }

    // Define a calculate_partition method for the PartitionCal struct that calculates the partition.
    fn calculate_partition(&mut self) -> i32 {
        self.partition[0] = 1; 
        let mut n = 0;         

        while self.partition[n as usize] != 0 {
            n += 1;
            self.partition[n as usize] = 0;

            // Calculate the partition value using the pentagonal numbers.
            for (sgn, g) in Self::pentagonal(n) {
                self.partition[n as usize] += sgn * self.partition[(n - g) as usize];
                self.partition[n as usize] %= self.modulus;
            }
        }

        n // return the final value of n
    }

    // Define a pentagonal function for the PartitionCal struct that generates the pentagonal numbers up to n.
    fn pentagonal(n: i32) -> Vec<(i32, i32)> {
        let mut a = 1;
        let mut b = 2;
        let mut delta = 4;
        let mut sgn = 1;
        let mut result = Vec::new();

        // Generate pentagonal numbers while a is less than or equal to n.
        while a <= n {
            result.push((sgn, a));
            a += delta;

            // Check if b is less than or equal to n, and if so, add b to the result.
            if b <= n {
                result.push((sgn, b));
                b += delta + 1;
            }

            delta += 3;
            sgn = -sgn; 
        }

        result 
    }
}

fn main() {
    // Get the modulus from the command line arguments.
    let args: Vec<String> = env::args().collect();

    if args.len() < 2 {
        println!("Please provide the modulus as a command line argument.");
        return;
    }

    let modulus: i32 = args[1].parse().expect("Invalid modulus provided.");
    let mut partition_calculator = PartitionCal::new(modulus); // Create an instance of PartitionCal with the given modulus.
    let result = partition_calculator.calculate_partition();    
    println!("{}", result);                                      
}

