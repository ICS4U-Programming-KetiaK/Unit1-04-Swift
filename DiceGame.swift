//
// DiceGame.swift
//
// Created by Ketia Gaelle Kaze
// Created on 2022-03-02
// Version 1.0
// Copyright (c) 2022 Ketia Gaelle Kaze. All rights reserved.
//
// The DiceGame program asks the user to guess a number and then the
// program tells the user if the guess is too low, too high 
// of correct and if it is correct then the
// it tells the number of tries it took to
// get the right answer.

import Foundation

// exception at runtime
enum MyError: Error {
    case runtimeError(String)
}

// function that gives the exception
func catchString() throws {
    throw MyError.runtimeError("Enter a valid integer!")
}

// declaring constants
let MIN = 1
let MAX = 6

// declaring variables
var ranNum = Int.random(in: MIN_NUM..<MAX_NUM + MIN_NUM)
var userGuessInt = 0
var tries = 0
var userGuessString: String

// use loop to guess number
while userGuessInt != ranNum {
    // get input from user
    print("Guess a number between 1 and 6: ", terminator: "")
    userGuessString = readLine()!

    do {
        // convert user input from string to an int
        userGuessInt = Int(userGuessString) ?? 0

        if userGuessInt != Int(userGuessString) {
            try catchString()
        }

        // check if guess is between 1 and 6
        if userGuessInt >= MIN_NUM && userGuessInt <= MAX_NUM {
            // increment tries
            tries += 1
            // check if guess is too high 
            if userGuessInt > ranNum {
                // display message 
                print("Your guess is too high.")

            // check if guess is too low
            } else if userGuessInt < ranNum {
                // displays message that tells user they are wrong
                print("Your guess is too low.")

            // check if guess is correct
            } else {
                // display message to tell user they are correct
                print("Your guess is correct!")
                print("It took \(tries) tries to get the right answer!")
                // break out of loop
                break
            }
        } else {
            // display error message
            print("Input is not between 1 and 6.")

        }
    } catch MyError.runtimeError(let errorMessage) {
        // catch invalid strings
        print(errorMessage)

    }
}
