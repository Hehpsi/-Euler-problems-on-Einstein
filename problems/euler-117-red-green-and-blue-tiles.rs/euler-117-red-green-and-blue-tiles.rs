// 31-40% Problem 117

use std::env;

// Define a struct named `WaysCal` to calculate the number of ways to reach a score using a certain number of steps
struct WaysCal {
    ways: [u64; 51], // Number of ways to reach each score, up to a maximum of 50 steps
}

impl WaysCal {
    // Define a function `new` for the `WaysCal` struct that initializes the `ways` array with zeros.
    fn new() -> Self {
        Self { ways: [0; 51] }
    }

    // Define a function `compute` for the `WaysCal` struct that computes the number of ways to reach a score using a certain number of steps.
    fn compute(&mut self, target_score: u64) -> String {
        self.ways[0] = 1; 
        for n in 1..self.ways.len() {
            self.ways[n] += self.ways.iter()
                .take(n) 
                .skip(n.saturating_sub(4)) 
                .sum::<u64>(); 
        }

        self.ways[target_score as usize].to_string() // Return the number of ways to reach the target score as a string.
    }
}

fn main() {
    // Get the target score from the command line argument.
    let args: Vec<String> = env::args().collect();

    if args.len() < 2 {
        println!("Please provide the target score as a command line argument.");
        return;
    }

    // Parse the target score from the command line argument.
    let target_score: u64 = match args[1].parse() {
        Ok(score) => score,
        Err(_) => {
            println!("Invalid target score provided.");
            return;
        }
    };
    let mut ways_calculator = WaysCal::new(); // Create a new instance of `WaysCal`.
    let result = ways_calculator.compute(target_score); 
    println!("{}", result); 
}

