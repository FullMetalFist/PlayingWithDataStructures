//
//  main.swift
//  PlayingWithDataStructures
//
//  Created by Michael Vilabrera on 5/28/15.
//  Copyright (c) 2015 Giving Tree. All rights reserved.
//

import Foundation

// Sorting
var numberList: Array<Int> = [8, 2, 10, 9, 11, 1, 7, 3, 4]

// insertion sort- rank items by comparing each key in the list
func insertionSort() {
    var x, y, key: Int
    
    for (x = 0; x < numberList.count; x++) {
        // obtain a key to be evaluated
        key = numberList[x]
        
        // iterate backwards through the sorted portion
        for (y = x; y > -1; y--) {
            
            if (key < numberList[y]) {
                // remove item from original position
                numberList.removeAtIndex(y + 1)
                
                // insert the number at the key position
                numberList.insert(key, atIndex: y)
            }
        }
    }
}

// bubble sort- rank items from lowest to highest by swapping groups of two items from left to right
func bubbleSort() {
    var x, y, z, passes, key: Int
    
    // track collection iterations
    for x in 0..<numberList.count {
        
        passes = (numberList.count - 1) - x
        
        // use shorthand "half-open" range operator
        for y in 0..<passes {
            key = numberList[y]
            
            // compare and rank values
            if (key > numberList[y + 1]) {
                z = numberList[y + 1]
                numberList[y + 1] = key
                numberList[y] = z
            }
        }
    }
}


//// Big-O Notation
//let numberList: Array<Int> = [1,2,3,4,5,6,7,8,9,10]
//
//// Brute force approach - O(n) linear time
//// checks all contents of the array
//func linearSearch(key: Int) {
//    // check all possible values until we get a match
//    for number in numberList {
//        if (number == key) {
//            let results = "value \(key) found"
//            break
//        }
//    }
//}
//
//// the binary search - O(log n) logarithmic time
//// more overall code but less searches run by the function
//func binarySearch(key: Int, imin: Int, imax: Int) {
//    // find the value in the middle index
//    var midIndex: Double = round(Double((imin + imax) / 2))
//    var midNumber = numberList[Int(midIndex)]
//    
//    // use recursion to reduce possible search range
//    if (midNumber > key) {
//        binarySearch(key, imin, Int(midIndex) - 1)
//    }
//    else if (midNumber < key) {
//        binarySearch(key, Int(midIndex) + 1, imax)
//    }
//    else {
//        let results = "value \(key) found"
//    }
//}

