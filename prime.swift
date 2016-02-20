#!/usr/bin/env xcrun swift
import Foundation

func measure(title: String, block: (() -> ()) -> ()) {
  let startTime = CFAbsoluteTimeGetCurrent()
  
  block {
    let timeElapsed = CFAbsoluteTimeGetCurrent() - startTime
    print("\(title) :: Time: \(timeElapsed)")
  }
}

func checkPrime(n: Int) -> Bool {
    if n < 2 {
        return false
    }
  
    let limit = Int(sqrt(Float(n)))
  
    if limit < 2 {
       return true
    }
  
    for i in 2...limit {
        if n % i == 0 {
            return false
        }
    }
  
    return true
}

measure("Find prime numbers between 2 and 10000000") {end in
  var primes: [Int] = []
  
  for i in 2...10000000 {
    if checkPrime(i) {
      primes.append(i)
    }
  }
  end()
}