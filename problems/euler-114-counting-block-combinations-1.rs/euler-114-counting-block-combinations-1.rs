// 31-40% Problem 114

use std::env;

// Define a struct named `Sequence` that represents a fan sequence.
struct Sequence {
    fan: Vec<usize>, 
    length: usize,   
}

impl Sequence {
    // Define a new function for the Sequence struct that creates a new instance of Sequence.
    fn new(length: usize) -> Self {
        Self {
            fan: vec![0; length + 1], 
            length,                   
        }
    }

    // Define a compute method for the Sequence struct that calculates the values of the fan sequence.
    fn compute(&mut self) {
        for n in 0..=self.length {
            if n < 3 {
                self.fan[n] = 1; // if n is less than 3, set the value to 1
            } else {
                self.fan[n] = self.fan[n - 1] + self.fan[..n - 3].iter().sum::<usize>() + 1;
            }
        }
    }

    fn get_result(&self) -> String {
        self.fan[self.length].to_string() // returns the final value of the fan sequence as a string
    }
}

fn main() {
    // Get the length from the command line arguments.
    let args: Vec<String> = env::args().collect();

    if args.len() < 2 {
        println!("Please provide the length as a command line argument.");
        return;
    }

    let length: usize = args[1].parse().expect("Invalid length provided.");
    let mut fan_sequence = Sequence::new(length); // Create an instance of Sequence with the given length.
    fan_sequence.compute(); 
    println!("{}", fan_sequence.get_result()); 
}
