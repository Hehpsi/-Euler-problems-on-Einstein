use std::env;
// 20-30% Problem 100

fn main() {
    let args: Vec<String> = env::args().collect();
    let l : u64 = match (&args[1]).parse::<u64>() {
       Ok(i) => i,
       Err(_) => {
           eprintln!("Invalid Input");
           return
       }
    };

    let mut b: u64 = 85; // Initialize the number of blue disks with 85.
    let mut n: u64 = 120; // Initialize another variable with 120.

    // Continue the loop while 'n' is less than or equal to the threshold value 'l'.
    while n <= l {
        // Calculate the new values for 'b' and 'n' based on specific formulas.
        let new_b = 3 * b + 2 * n - 2;
        let new_n = 4 * b + 3 * n - 3;
        
        // Update 'b' and 'n' with the newly calculated values.
        b = new_b;
        n = new_n;
    }

    // Print the final results after the loop has completed.
    println!("{}", b); // Print the final number of blue disks.
}
