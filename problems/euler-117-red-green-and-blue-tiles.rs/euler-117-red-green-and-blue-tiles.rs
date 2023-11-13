use std::env;
// 31-40% Problem 117
fn compute(length : usize) -> String {
    // Dynamic programming approach to calculate the number of ways
    
    // Initialize an array to store the number of ways
    let mut ways: [u64; 51] = [0; 51];
    
    // Initialize the base case: there is 1 way for the length of 0
    ways[0] = 1;
    
    // Iterate through the array to compute the number of ways for each length
    for n in 1..ways.len() {
        // Calculate the number of ways for the current length by summing values from previous lengths

        ways[n] += ways.iter()
            .take(n)  // Consider values up to the current length
            .skip(n.saturating_sub(4))  // Skip values from more than 4 positions back to avoid negative indices
            .sum::<u64>();  // Sum the selected values
    }

    // Convert the final value at index length to a string and return it
    ways[length].to_string()
}

fn main() {
    let args: Vec<String> = env::args().collect();
    let l : usize = match (&args[1]).parse::<usize>() {
       Ok(i) => i,
       Err(_) => {
           eprintln!("Invalid Input");
           return
       }
    };
    if l > 50 {
        return;
    }
    // Calculate the number of ways using the `compute` function and print the result
    println!("{}", compute(l));
}
