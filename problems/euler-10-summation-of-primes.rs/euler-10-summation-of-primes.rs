use std::env;

// <20% Problem 10
// Function to check if a number is prime.
fn is_prime(n: u64) -> bool {
  // Check if the number is exactly 2; 2 is prime.
  if n == 2 {
      return true;
  }
  
  // Check if the number is less than 2; all numbers less than 2 are not prime.
  if n < 2 {
      return false;
  }
  
  // Check if the number is even (except for 2); even numbers are not prime.
  if n % 2 == 0 {
      return false;
  }

  // Start checking for prime factors from 3 onwards.
  let mut i = 3;
  // Continue until the square of 'i' is less than or equal to 'n'.
  while i * i <= n {
      // If 'n' is divisible by 'i', it's not prime.
      if n % i == 0 {
          return false;
      }
      // Move to the next odd number to check for divisibility.
      i += 2; // Only check odd numbers since even numbers have already been excluded.
  }

  // If none of the conditions are met, the number is prime.
  true
}

fn main() {
  let args: Vec<String> = env::args().collect();
  let n : u64 = match (&args[1]).parse::<u64>() {
    Ok(i) => i,
    Err(_) => {
        eprintln!("Invalid Input");
        return
    }
  };



  let mut i: u64 = 1; // Initialize a counter for numbers to be tested.
  let mut total: u64 = 0; // Initialize a total to accumulate prime numbers.

  // Iterate through numbers from 1 to 2,000,000.
  while i < n {
      // If 'i' is prime, add it to the 'total' accumulator.
      if is_prime(i) {
          total += i;
      }
      // Move on to the next number to be tested.
      i = i + 1;
  }

  // Print the sum of prime numbers within the given range.
  println!("{}", total);
}
