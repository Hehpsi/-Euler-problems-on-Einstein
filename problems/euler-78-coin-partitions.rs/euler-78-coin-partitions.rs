use std::env;
// 20-30% Problem 78
// Define a function to generate a list of pentagonal numbers up to 'n'.
fn pentagonal(n: i32) -> Vec<(i32, i32)> {
    let mut a = 1;
    let mut b = 2;
    let mut delta = 4;
    let mut sgn = 1;
    let mut result = Vec::new();

    // Generate pentagonal numbers up to 'n'.
    while a <= n {
        result.push((sgn, a));
        a += delta;

        if b <= n {
            result.push((sgn, b));
            b += delta + 1;
        }

        delta += 3;
        sgn = -sgn;
    }

    result
}

fn main() {
    let args: Vec<String> = env::args().collect();
    let modulus : i32 = match (&args[1]).parse::<i32>() {
       Ok(i) => i,
       Err(_) => {
           eprintln!("Invalid Input");
           return
       }
    };

    let mut p = vec![0; modulus as usize];
    p[0] = 1;
    let mut n = 0;

    // Calculate the partition function using the pentagonal numbers.
    while p[n as usize] != 0 {
        n += 1;
        p[n as usize] = 0;

        for (sgn, g) in pentagonal(n) {
            // println!("# {} {}", g, n);
            p[n as usize] += sgn * p[(n - g) as usize];
            // println!("-- {}", n-g);
            // println!("+- {}", sgn * p[(n - g) as usize]);

            p[n as usize] %= modulus;
            // println!("# {}", p[n as usize]);
        }
    }

    // Print the result, which is the first value of 'n' for which p[n] is divisible by 10^6.

    println!("{}", n);
}
