use std::env;

fn main() {
    // get input
    
    let args: Vec<String> = env::args().collect();

    let n = match (&args[1]).parse::<u32>() {
        Ok(input) => input,
        Err(_) => {
            eprintln!("Invalid Input!");
            return
        }
    };

    // Call the function to calculate the sum of multiples of 3 or 5 below 1000
    let sum = sum_of_multiples_below_limit(n);
    // Print the result to the console
    println!("{}", sum);
}

// Define a function to calculate the sum of multiples of 3 or 5 below a given limit
fn sum_of_multiples_below_limit(limit: u32) -> u32 {
    let mut sum = 0;

    // Iterate through numbers from 1 to (limit - 1)
    for num in 1..limit {
        // Check if the current number is a multiple of 3 or 5
        if num % 3 == 0 || num % 5 == 0 {
            // If it is, add it to the running sum
            sum += num;
        }
    }

    // Return the final sum as the result of the function
    sum
}

