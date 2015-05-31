//
//  main.swift
//  PlayingWithDataStructures
//
//  Created by Michael Vilabrera on 5/28/15.
//  Copyright (c) 2015 Giving Tree. All rights reserved.
//

import Foundation

// binary search trees
// generic binary search tree
public class AVLTree<T: Comparable> {
    var key: T?
    var left: AVLTree?
    var right: AVLTree?
    
    // a simple array of unsorted integers
    let numberList: Array<Int> = [8, 2, 10, 9, 11, 1, 7]
    
    // create a new BST instance
    var root = AVLTree<Int>()
    
//    // sort each item in the list
//    for (number in numberList) {        // expected declaration
//        root.addNode(number)
//    }
    
    // add item based on its value
    func addNode(key: T) {
        // check for the head node
        if (self.key == nil) {
            self.key = key
            return
        }
        
        // check the left side of the tree
        if (key < self.key) {
            if (self.left != nil) {
                left!.addNode(key)
            }
            else {
                // create a new left node
                var leftChild: AVLTree = AVLTree()
                leftChild.key = key
                self.left = leftChild
            }
        }
        
        // check the right side of the tree
        if (key > self.key) {
            if (self.right != nil) {
                right!.addNode(key)
            }
            else {
                // create a new right node
                var rightChild: AVLTree = AVLTree()
                rightChild.key = key
                self.right = rightChild
            }
        }
    }
    
    init() {
        
    }
    
    // tree balancing
    // a simple array of unsorted integers
    let balanceList: Array<Int> = [29, 26, 23]
    
    // retreive the height of a node
    func getNodeHeight(aNode: AVLTree!) -> Int {
        if (aNode == nil) {
            return -1
        }
        else {
//            return aNode
            //
        }
    }
}

//// Linked Lists
//// generic doubly linked list structure
//class LLNode<T> {
//    var key: T?
//    var next: LLNode?
//    var previous: LLNode?
//}
//
//public class LinkedList<T: Equatable> {
//    // create a new LLNode instance
//    private var head: LLNode<T> = LLNode<T>()
//    
//    // print all keys for the class
//    func printAllKeys() {
//        var current: LLNode! = head     // use of unresolved identifier 'head'
//        
//        // assign the next instance
//        while(current != nil)           // could not find an overload for '!=' that accepts the supplied arguments
//        {
//            println("link item is: \(current.key)")
//            current = current.next
//        }
//    }
//    
//    // append a new item to a linked list
//    func addLink(key: T) {
//        
//        // establish the head node
//        if (head.key == nil) {
//            head.key = key
//            return
//        }
//        
//        // establish the iteration variables
//        var current: LLNode? = head
//        
//        while (current != nil) {
//            if (current?.next == nil) {
//                var childToUse: LLNode = LLNode<T>()
//                
//                childToUse.key = key
//                childToUse.previous = current
//                current!.next = childToUse
//                break
//            }
//            current = current?.next
//        }
//    }
//    
//    // remove a link at a specific index
//    func removeLinkAtIndex(index: Int) {
//        var current: LLNode<T>? = head
//        var trailer: LLNode<T>?
//        var listIndex: Int = 0
//        
//        // determine if the removal is at the head
//        if (index == 0) {
//            current = current?.next
//            head = current!
//            return
//        }
//        
//        // iterate through the remaining items
//        while (current != nil) {
//            if (listIndex == index) {
//                // redirect the trailer and next pointers
//                trailer!.next = current?.next
//                current = nil
//                break
//            }
//            
//            // update the assignments
//            trailer = current
//            current = current?.next
//            listIndex++
//        }
//    }
//    
//    // the number of linked items
//    var count: Int {
//        if (head.key == nil) {
//            return 0
//        }
//        
//        else {
//            var current: LLNode = head
//            var x: Int = 1
//            
//            // cycle through the list of items
//            while (current.next != nil) {
//                current = current.next!
//                x++
//            }
//            return x        // non-void function should return a value
//            // strangely enough adding the comment made the error disappear
//        }
//    }
//}

//// Sorting
//var numberList: Array<Int> = [8, 2, 10, 9, 11, 1, 7, 3, 4]
//
//// insertion sort- rank items by comparing each key in the list
//func insertionSort() {
//    var x, y, key: Int
//    
//    for (x = 0; x < numberList.count; x++) {
//        // obtain a key to be evaluated
//        key = numberList[x]
//        
//        // iterate backwards through the sorted portion
//        for (y = x; y > -1; y--) {
//            
//            if (key < numberList[y]) {
//                // remove item from original position
//                numberList.removeAtIndex(y + 1)
//                
//                // insert the number at the key position
//                numberList.insert(key, atIndex: y)
//            }
//        }
//    }
//}
//
//// bubble sort- rank items from lowest to highest by swapping groups of two items from left to right
//func bubbleSort() {
//    var x, y, z, passes, key: Int
//    
//    // track collection iterations
//    for x in 0..<numberList.count {
//        
//        passes = (numberList.count - 1) - x
//        
//        // use shorthand "half-open" range operator
//        for y in 0..<passes {
//            key = numberList[y]
//            
//            // compare and rank values
//            if (key > numberList[y + 1]) {
//                z = numberList[y + 1]
//                numberList[y + 1] = key
//                numberList[y] = z
//            }
//        }
//    }
//}

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