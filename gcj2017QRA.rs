#!/usr/bin/env cargo script
fn solve() -> String {
    let mut sk = String::new();
    std::io::stdin().read_line(&mut sk).unwrap();
    let mut sk = sk.split_whitespace();
    let mut s: Vec<u8> = sk.next().unwrap().chars().map(|c|if c!='-' {1} else {0}).collect();
    let k:usize = sk.next().unwrap().parse().unwrap(); 
    let mut n=0;
    for i in 0..std::cmp::max(0,s.len()-k+1) {
        if s[i]==0 {
            n+=1;
            for j in i..i+k {
                s[j]^=1;
            }
        }
    }
    for c in s {
        if c==0 {
            return "IMPOSSIBLE".to_string();
        }
    }
    n.to_string()
}
fn main() {
    let mut t = String::new();
    std::io::stdin().read_line(&mut t).unwrap();
    let t: u32 = t.trim_right().parse().unwrap();
    for i in 0..t {
        println!("Case #{}: {}",i+1,solve())
    }
}
