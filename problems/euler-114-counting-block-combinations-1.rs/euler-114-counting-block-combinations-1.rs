use std::env;
// 31-40% Problem 114
fn compute(length : usize) -> String {
    // Dynamic programming approach to calculate a sequence
    
    // Initialize a vector to store calculated values
    let mut fan = vec![0; length + 1];

    // Loop through elements up to the specified length
    for n in 0..=length {
        if n < 3 {
            // For elements 0, 1, and 2, set their values to 1
            fan[n] = 1;
        } else {
            // For other elements, compute the value using the previously calculated values in the fan vector
            fan[n] = fan[n - 1] + fan[0..n - 3].iter().sum::<usize>() + 1;
        }
    }

    // Convert the final value at index length to a string and return it
    fan[length].to_string()
}

fn main() {
    // Calculate the value using the `compute` function and print the result
    let args: Vec<String> = env::args().collect();
    let l : usize = match (&args[1]).parse::<usize>() {
       Ok(i) => i,
       Err(_) => {
           eprintln!("Invalid Input");
           return
       }
    };
    println!("{}", compute(l));
}
