fn optimus_sum(numbers: Vec<i64>) -> Vec<Vec<i64>> {
    use primes::{Sieve, PrimeSet};

    let mut result = vec![];

    let mut primes = Sieve::new();
    let mut primes_iter = primes.iter();

    let mut prime = primes_iter.next();
    while let Some(prime_nr) = prime {
        prime = primes_iter.next();

        let mut matches = false;
        let mut sum = 0;
        for nr in &numbers {
            if nr % (prime_nr as i64) != 0 {
                continue;
            }
            matches = true;
            sum += nr
        }
    
        if !matches {
            break;
        }

        result.push(
            vec![prime_nr as i64, sum]
        );
    }

    return result;
}

fn main() {
    let result = optimus_sum(vec![12, 15]);
    for x in &result {
        for y in x {
            print!("{y} ");
        }
        println!("");
    }
}
