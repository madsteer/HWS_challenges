//: Playground - noun: a place where people can play

import Cocoa

func fizzbuzz(_ input: Int) -> String {
    if input % (3 * 5) == 0 {
        return "Fizz Buzz"
    }
    if input % 3 == 0 {
        return "Fizz"
    }
    if input % 5 == 0 {
        return "Buzz"
    }
    return String(input)
}

fizzbuzz(3)
fizzbuzz(5)
fizzbuzz(15)
fizzbuzz(30)
fizzbuzz(18)
fizzbuzz(16)
fizzbuzz(20)

