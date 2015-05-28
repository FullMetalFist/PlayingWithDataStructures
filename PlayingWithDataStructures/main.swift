//
//  main.swift
//  PlayingWithDataStructures
//
//  Created by Michael Vilabrera on 5/28/15.
//  Copyright (c) 2015 Giving Tree. All rights reserved.
//

import Foundation

// Big-O Notation
let numberList: Array<Int> = [1,2,3,4,5,6,7,8,9,10]

// Brute force approach - O(n) linear time
// checks all contents of the array
func linearSearch(key: Int) {
    // check all possible values until we get a match
    for number in numberList {
        if (number == key) {
            let results = "value \(key) found"
            break
        }
    }
}

// the binary search - O(log n) logarithmic time
// more overall code but less searches run by the function
func binarySearch(key: Int, imin: Int, imax: Int) {
    // find the value in the middle index
    var midIndex: Double = round(Double((imin + imax) / 2))
    var midNumber = numberList[Int(midIndex)]
    
    // use recursion to reduce possible search range
    if (midNumber > key) {
        binarySearch(key, imin, Int(midIndex) - 1)
    }
    else if (midNumber < key) {
        binarySearch(key, Int(midIndex) + 1, imax)
    }
    else {
        let results = "value \(key) found"
    }
}

