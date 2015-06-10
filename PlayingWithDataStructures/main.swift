//
//  main.swift
//  PlayingWithDataStructures
//
//  Created by Michael Vilabrera on 5/28/15.
//  Copyright (c) 2015 Giving Tree. All rights reserved.
//

import Foundation

// trie
// generic trie data structure
public class TrieNode {
    var key: String!
    var children: Array<TrieNode>
    var isFinal: Bool
    var level: Int
    
    init() {
        self.children = Array<TrieNode>()
        self.isFinal = false
        self.level = 0
    }
}

// generic trie implementation
public class Trie {
    private var root: TrieNode!
    
    init() {
        root = TrieNode()
    }
    
    // builds a recursive tree of dictionary content
    func addWord(keyword: String) {
        if (keyword.length == 0) {
            return;
        }
        var current: TrieNode = root
        var searchKey: String!
        
        while(keyword.length != current.level) {
            var childToUse: TrieNode!
            var searchKey = keyword.substringToIndex(current.level + 1)     // cannot invoke 'substringToIndex' with an argument list of type '(Int)'
            
            // iterate through the node children
            for child in current.children {
                if (child.key == searchKey) {
                    childToUse = child
                    break
                }
            }
            
            // create a new node
            if (childToUse == nil) {
                childToUse = TrieNode()
                childToUse.key = searchKey
                childToUse.level = current.level + 1
                current.children.append(childToUse)
            }
            
            current = childToUse
        }
        
        // add final end of word check
        if (keyword.length == current.level) {
            current.isFinal = true
            println("end of word reached!")
            return
        }
    }
    
    // find all words based on a prefix
    func findWord(keyword: String) -> Array<String>! {
        if (keyword.length == 0) {
            return nil
        }
        
        var current: TrieNode = root
        var searchKey: String!
        var wordList: Array<String>! = Array<String>()
        
        while(keyword.length != current.level) {
            var childToUse: TrieNode!
            var searchKey = keyword.substringToIndex(current.level + 1)
            
            
            // iterate through any children
            for child in current.children {
                if (child.key == searchKey) {
                    childToUse = child
                    current = childToUse
                    break
                }
            }
            
            // prefix not found
            if (childToUse == nil) {
                return nil
            }
        }
        
        // retrieve keyword and any decendants
        if ((current.key == keyword) && (current.isFinal)) {
            wordList.append(current.key)
        }
        
        // add children that are words
        for child in current.children {
            if (child.isFinal == true) {
                wordList.append(child.key)
            }
        }
        
        return wordList
    }
}

// extend the native String class
extension String {
    // compute the length of string
    var length: Int {       // invalid redeclaration of 'length'
        return Array(self).count
    }
    
    // returns characters of a string up to a specified index
    func substringToIndex(to: Int) -> String {
        return self.substringToIndex(advance(self.startIndex, to))
    }
}

//// binary search tree rotations
//// generic binary search tree
//public class AVLTree<T: Comparable> {
//    var key: T?
//    var left: AVLTree?
//    var right: AVLTree?
//    var height: Int
//    
//    // a simple array of unsorted integers
//    let numberList: Array<Int> = [8, 2, 10, 9, 11, 1, 7]
//    
//    // create a new BST instance
//    var root = AVLTree<Int>()
//    
//    init() {
//        // set for math purposes
//        self.height = -1
//    }
//    
//    // add item based on its value
//    func addNode(key: T) {
//        // check for the head node
//        if (self.key == nil) {
//            self.key = key
//            self.height = 0
//            return
//        }
//        
//        // check the left side of the tree
//        if (key < self.key) {
//            
//            if (self.left != nil) {
//                left!.addNode(key)
//            }
//            else {
//                // create a new left node
//                var leftChild: AVLTree = AVLTree()
//                leftChild.key = key
//                leftChild.height = 0
//                self.left = leftChild               // cannot assign a value of type '()' to a value of type int
//            }
//            
//            // recalculate node height for hierarchy
//            self.setNodeHeight()
//            println("traversing left side. node \(self.key!) with height \(self.height)")
//            
//            // check AVL property
//            self.isValidAVLTree()
//        }
//        
//        // check the right side of the tree
//        if (key > self.key) {
//            
//            if (self.right != nil) {
//                right?.addNode(key)
//            }
//            else {
//                // create a new right node
//                var rightChild: AVLTree = AVLTree()
//                rightChild.key = key
//                rightChild.height = 0
//                self.right = rightChild     // cannot assign a value of type '()' to a value type of 'Int'
//            }
//            
//            // recalculate node height for hierarchy
//            self.setNodeHeight()
//            println("traversing right side. node \(self.key!) with height: \(self.height)")
//            
//            // check AVL property
//            self.isValidAVLTree()
//        }
//        
//    } // end function
//    
//    // retreive the height of a node
//    func getNodeHeight(aNode: AVLTree!) -> Int {
//        if (aNode == nil) {
//            return -1
//        }
//        else {
//            return aNode.height
//        }
//    }
//    
//    // calculate the height of a node
//    func setNodeHeight() -> Bool {
//        // check for a nil condition
//        if (self.key == nil) {
//            println("no key provided")
//            return false
//        }
//        
//        //println("key: \(self.key!)")
//        
//        // initialize leaf variables
//        var nodeHeight: Int = 0
//        
//        // do comparison and calculate node height
//        nodeHeight = max(getNodeHeight(self.left), getNodeHeight(self.right)) + 1
//        
//        self.height = nodeHeight
//        
//        return true
//    }
//    
//    // determine if the tree is "balanced" - operations on a balanced tree is O(log n)
//    func isTreeBalanced() -> Bool {
//        
//        // check for a nil condition
//        if (self.key == nil) {
//            println("no key provided...")
//            return false
//        }
//        
//        // use absolute value to manage right and left imbalances
//        if (abs(getNodeHeight(self.left) - getNodeHeight(self.right)) <= 1) {
//            return true
//        }
//        else {
//            return false
//        }
//    } // end function
//    
//    // check to ensure node meeds AVL property
//    func isValidAVLTree() -> Bool! {
//        
//        // check for valid scenario
//        if (self.key == nil) {
//            println("no key provided..")
//            return false
//        }
//        
//        if (self.isTreeBalanced() == true) {
//            println("node \(self.key!) already balanced..")
//            return true
//        }
//        
//        // determine rotation type
//        else {
//            
//            // create a new leaf node
//            var childToUse: AVLTree = AVLTree()
//            childToUse.height = 0
//            childToUse.key = self.key
//            
//            if (getNodeHeight(self.left) - getNodeHeight(self.right) > 1) {
//                println("n starting right rotation on \(self.key!)..")
//                
//                // reset the root node
//                self.key = self.left?.key
//                self.height = getNodeHeight(self.left)
//                
//                // assign the new right node
//                self.right = childToUse
//                
//                // adjust the left node
//                self.left = self.left?.left
//                self.left?.height = 0
//                
//                println("root is: \(self.key!) | left is: \(self.left!.key) | right is: \(self.right!.key)")
//                
//                return true
//            }
//            
//            if (getNodeHeight(self.right) - getNodeHeight(self.left) > 1) {
//                println("\n starting left rotation on \(self.key!)..")
//                
//                // reset the root node
//                self.key = self.right?.key
//                self.height = getNodeHeight(self.right)
//                
//                // assign the new left node
//                self.left = childToUse
//                
//                // adjust the right node
//                self.right = self.right?.right
//                self.right?.height = 0
//                
//                println("root is: \(self.key!) | left is: \(self.left!.key) | right is: \(self.right!.key)")
//                
//                return true
//            }
//            
//            return nil
//        }
//    } // end function
//    
//    // depth first search in-order traversal
//    func processAVLDepthTraversal() {
//        
//        // check for a nil condition
//        if (self.key == nil) {
//            println("no key provided")
//            return
//        }
//        
//        // process left side
//        if (self.left != nil) {
//            left?.processAVLDepthTraversal()
//        }
//        
//        println("..the traversed value is: \(self.key!). height: \(self.height)..")
//        
//        // process the right side
//        if (self.right != nil) {
//            right?.processAVLDepthTraversal()
//        }
//    } // end function
//}

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