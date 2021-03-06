//
//  main.swift
//  PlayingWithDataStructures
//
//  Created by Michael Vilabrera on 5/28/15.
//  Copyright (c) 2015 Giving Tree. All rights reserved.
//
// this is NOT MY CODE
// from: http://waynewbishop.com/swift
//

import Foundation

// hash tables
// simple example of a hash table node

class HashNode {
    var firstName: String!
    var lastName: String!
    var next: HashNode!
}

class HashTable {
    private var buckets: Array<HashNode!>
    
    // initialize the buckets with nil values
    init(capacity: Int) {
        self.buckets = Array<HashNode!>(count: capacity, repeatedValue: nil)
    }
    
    func addWord(firstName: String, lastName: String) {
        
        var hashIndex: Int!
        var fullName: String!
        
        // create a hashvalue using the complete name
        fullName = fullName + lastName
        hashIndex = self.createHash(fullName)
        
        var childToUse: HashNode = HashNode()
        var head: HashNode!
        
        childToUse.firstName = firstName
        childToUse.lastName = lastName
        
        // check for an existing bucket
        if (buckets[hashIndex] == nil) {
            buckets[hashIndex] = childToUse
        }
        else {
            println("a collision occurred. implementing chaining..")
            head = buckets[hashIndex]
            
            // append new item to the head of the list
            childToUse.next = head
            head = childToUse
            
            // update the chained list
            buckets[hashIndex] = head
        }
    }
    
    func createHash(fullName: String) -> Int! {
        var remainder: Int = 0
        var divisor: Int = 0
        
        // obtain the ascii value of each character
        for key in fullName.unicodeScalars {
            divisor += Int(key.value)
        }
        
        remainder = divisor % buckets.count
        return remainder
    }
}

//// traversals
//// depth-first in-order traversal
//class AVLTree<T: Comparable> {
//    
//    var key: T?
//    var left: AVLTree?
//    var right: AVLTree?
//    init() {
//        
//    }
//    
//    func processAVLDepthTraversal() {
//        //generic binary search tree
//        
//        // check for a nil condition
//        if (self.key == nil) {
//            println("no key provided")
//            return
//        }
//        
//        // process the left side
//        if (self.left != nil) {
//            left?.processAVLDepthTraversal()
//        }
//        
//        println("key is \(self.key!) visited...")
//        
//        // process the right side
//        if (self.right != nil) {
//            right?.processAVLDepthTraversal()
//        }
//    } // end function
//    
//    // breadth-first traversal
//    func traverseGraphBFS(startingV:Vertex) {
//        
//        // establish a new queue
//        var graphQueue: Queue<Vertex> = Queue<Vertex>()
//        
//        // queue a starting vertex
//        graphQueue.enQueue(startingV)
//        
//        while(!graphQueue.isEmpty()) {
//            
//            // traverse the next queued vertex
//            var vitem = graphQueue.deQueue() as Vertex!
//            
//            // add unvisited vertices to the queue
//            for e in vitem.neighbors {
//                if e.neighbor.visited == false {
//                    println("adding vertex: \(e.neighbor.key!)")
//                    graphQueue.enQueue(e.neighbor)
//                }
//            }
//            
//            vitem.visited = true
//            println("traversed vertex: \(vitem.key!)..")
//        } // end while
//        
//        println("graph traversal complete")
//    }
//}
//
//public class Vertex {
//    var key: String?
//    var neighbors: Array<Edge>
//    var visited: Bool?
//    
//    init() {
//        self.neighbors = Array<Edge>()
//    }
//}
//public class Edge {
//    var neighbor: Vertex
//    var weight: Int
//    
//    init() {
//        weight = 0
//        self.neighbor = Vertex()
//    }
//}
//
//class QNode<T> {
//    var key: T?
//    var next: QNode?
//}
//
//public class Queue<T> {
//    private var top: QNode<T>! = QNode<T>()
//
//    // enqueue the specified object
//    func enQueue(var key:T) {
//
//        // check for the instance
//        if (top == nil) {
//            top = QNode<T>()
//        }
//
//        // establish the top node
//        if (top.key == nil) {
//            top.key = key;
//            return
//        }
//
//        var childToUse: QNode<T> = QNode<T>()
//        var current: QNode = top
//
//        // cycle through the list of items to get to the end
//        while (current.next != nil) {
//            current = current.next!
//        }
//
//        // append a new item
//        childToUse.key = key
//        current.next = childToUse
//    }
//
//    // retrieve items from the top level in 0(1) constant time
//    func deQueue() -> T? {
//
//        // determine if the key or instance exists
//        let topItem: T? = self.top?.key
//
//        if (topItem == nil) {
//            return nil
//        }
//
//        // retrieve and queue the next item
//        var queueItem: T? = top.key!
//
//        // use optional binding
//        if let nextItem = top.next {
//            top = nextItem
//        }
//        else {
//            top = nil
//        }
//
//        return queueItem
//    }
//
//    // check for the presence of a value
//    func isEmpty() -> Bool {
//
//        // determine if the key or instance exists
//        if let topItem: T = self.top?.key {
//            return false
//        }
//        else {
//            return true
//        }
//    }
//
//    // retrieve the topmost item
//    func peek() -> T? {
//        return top.key!
//    }
//}

//// heaps
//// obtain the best path
//// a basic min-heap data structure
//public class PathHeap {
//    
//    private var heap: Array<Path>
//    
//    // the number of frontier items
//    var count: Int {
//        return self.heap.count
//    }
//    
//    init() {
//        heap = Array<Path>()
//    }
//    
//    // obtain the minimum path
//    func peek() -> Path! {
//        if (heap.count > 0) {
//            return heap[0]  // shortest path
//        }
//        else {
//            return nil
//        }
//    }
//    
//    // remove the minimum path
//    func enQueue(key: Path) {
//        
//        heap.append(key)
//        
//        var childIndex: Float = Float(heap.count) - 1
//        var parentIndex: Int! = 0
//        
//        // calculate parent index
//        if (childIndex != 0) {
//            parentIndex = Int(floorf((childIndex - 1) / 2))
//        }
//        
//        var childToUse: Path
//        var parentToUse: Path
//        
//        // use the bottom-up approach
//        while childIndex != 0 {
//            
//            childToUse = heap[Int(childIndex)]
//            parentToUse = heap[parentIndex]
//            
//            // swap child and parent positions
//            if childToUse.total < parentToUse.total {
//                swap(&heap[parentIndex], &heap[Int(childIndex)])
//            }
//            
//            // reset indices
//            childIndex = Float(parentIndex)
//            
//            if (childIndex != 0) {
//                parentIndex = Int(floorf((childIndex - 1) / 2))
//            }
//        }
//    }
//}
//
//class Path {
//    var total: Int!
//    var destination: Vertex
//    var previous: Path!
//
//    // object initialization
//    init() {
//        destination = Vertex()
//    }
//}
//
//public class Vertex {
//    var key: String?
//    var neighbors: Array<Edge>
//
//    init() {
//        self.neighbors = Array<Edge>()
//    }
//}
//
//// an edge data structure
//public class Edge {
//    var neighbor: Vertex
//    var weight: Int
//
//    init() {
//        weight = 0
//        self.neighbor = Vertex()
//    }
//}

//// shortest paths
//// maintain objects that make the "frontier"
//class Path {
//    var total: Int!
//    var destination: Vertex
//    var previous: Path!
//    
//    // object initialization
//    init() {
//        destination = Vertex()
//    }
//}
//
//public class Vertex {
//    var key: String?
//    var neighbors: Array<Edge>
//
//    init() {
//        self.neighbors = Array<Edge>()
//    }
//}
//
//// an edge data structure
//public class Edge {
//    var neighbor: Vertex
//    var weight: Int
//
//    init() {
//        weight = 0
//        self.neighbor = Vertex()
//    }
//}
//
//// process Dijkstra's shortest path algorithm
//func processDijkstra(source: Vertex, destination: Vertex) -> Path? {
//    var frontier: Array?
//    var finalPaths: Array?
//    
//    // use source edges to create the frontier
//    for e in source.neighbors {
//        var newPath: Path = Path()
//        
//        newPath.destination = e.neighbor
//        newPath.previous = nil
//        newPath.total = e.weight
//        
//        // add the new path to the frontier
//        frontier.append(newPath)
//    }
//    
//    // obtain the best path
//    var bestPath: Path = Path()
//    while(frontier.count != 0) {
//        // support path changes using the greedy approach
//        bestPath = Path()
//        
//        var x: Int = 0
//        var pathIndex: Int = 0
//        
//        for(x = 0; x < frontier.count; x++) {
//            var itemPath: Path = frontier[x]
//            
//            if (bestPath.total == nil) || (itemPath.total < bestPath.total) {
//                bestPath = itemPath
//                pathIndex = x
//            }
//        }
//        // enumerate the bestPath edges
//        for e in bestPath.destination.neighbors {
//            var newPath: Path = Path()
//            
//            newPath.destination = e.neighbor
//            newPath.previous = bestPath
//            newPath.total = bestPath.total + e.weight
//            
//            // add the new path to the frontier
//            frontier.append(newPath)
//        }
//        
//        // preserve the bestPath
//        finalPaths.append(bestPath)
//        
//        // remove bestPath from the frontier
//        frontier.removeAtIndex(pathIndex)
//    }
//    
//    // establish the shortestPath as an optional
//    var shortestPath: Path! = Path()
//    
//    for itemPath in finalPaths {
//        if (itemPath.destination.key == destination.key) {
//            
//            if(shortestPath.total == nil) || (itemPath.total < shortestPath.total) {
//                shortestPath = itemPath
//            }
//        }
//    }
//    
//    return shortestPath
//}

//// a vertex data structure
//public class Vertex {
//    var key: String?
//    var neighbors: Array<Edge>
//    
//    init() {
//        self.neighbors = Array<Edge>()
//    }
//}
//
//// an edge data structure
//public class Edge {
//    var neighbor: Vertex
//    var weight: Int
//    
//    init() {
//        weight = 0
//        self.neighbor = Vertex()
//    }
//}
//
//// a default directed graph canvas
//public class SwiftGraph {
//    private var canvas: Array<Vertex>
//    public var isDirected: Bool
//    
//    init () {
//        canvas = Array<Vertex>()
//        isDirected = true
//    }
//    
//    // create a new vertex
//    func addVertex(key: String) -> Vertex {
//        
//        // set the key
//        var childVertex: Vertex = Vertex()
//        childVertex.key = key
//        
//        // add the vertex to the graph canvas
//        canvas.append(childVertex)
//        
//        return childVertex
//    }
//    
//    // add an edge to source vertex
//    func addEdge(source: Vertex, neighbor: Vertex, weight: Int) {
//        
//        // create a new edge
//        var newEdge = Edge()
//        
//        // establish the default properties
//        newEdge.neighbor = neighbor
//        newEdge.weight = weight
//        source.neighbors.append(newEdge)
//        
//        // check for undirected graph
//        if (isDirected == false) {
//            
//            // create a new reversed edge
//            var reversedEdge = Edge()
//            
//            // establish the reversed properties
//            reversedEdge.neighbor = source
//            reversedEdge.weight = weight
//            neighbor.neighbors.append(reversedEdge)
//        }
//    }
//}



//// stacks & queues
//// generic queue data object
//class QNode<T> {
//    var key: T?
//    var next: QNode?
//}
//
//public class Queue<T> {
//    private var top: QNode<T>! = QNode<T>()
//    
//    // enqueue the specified object
//    func enQueue(var key:T) {
//        
//        // check for the instance
//        if (top == nil) {
//            top = QNode<T>()
//        }
//        
//        // establish the top node
//        if (top.key == nil) {
//            top.key = key;
//            return
//        }
//        
//        var childToUse: QNode<T> = QNode<T>()
//        var current: QNode = top
//        
//        // cycle through the list of items to get to the end
//        while (current.next != nil) {
//            current = current.next!
//        }
//        
//        // append a new item
//        childToUse.key = key
//        current.next = childToUse
//    }
//    
//    // retrieve items from the top level in 0(1) constant time
//    func deQueue() -> T? {
//        
//        // determine if the key or instance exists
//        let topItem: T? = self.top?.key
//        
//        if (topItem == nil) {
//            return nil
//        }
//        
//        // retrieve and queue the next item
//        var queueItem: T? = top.key!
//        
//        // use optional binding
//        if let nextItem = top.next {
//            top = nextItem
//        }
//        else {
//            top = nil
//        }
//        
//        return queueItem
//    }
//    
//    // check for the presence of a value
//    func isEmpty() -> Bool {
//        
//        // determine if the key or instance exists
//        if let topItem: T = self.top?.key {
//            return false
//        }
//        else {
//            return true
//        }
//    }
//    
//    // retrieve the topmost item
//    func peek() -> T? {
//        return top.key!
//    }
//}

//// trie
//// generic trie data structure
//public class TrieNode {
//    var key: String!
//    var children: Array<TrieNode>
//    var isFinal: Bool
//    var level: Int
//    
//    init() {
//        self.children = Array<TrieNode>()
//        self.isFinal = false
//        self.level = 0
//    }
//}
//
//// generic trie implementation
//public class Trie {
//    private var root: TrieNode!
//    
//    init() {
//        root = TrieNode()
//    }
//    
//    // builds a recursive tree of dictionary content
//    func addWord(keyword: String) {
//        if (keyword.length == 0) {
//            return;
//        }
//        var current: TrieNode = root
//        var searchKey: String!
//        
//        while(keyword.length != current.level) {
//            var childToUse: TrieNode!
//            var searchKey = keyword.substringToIndex(current.level + 1)     // cannot invoke 'substringToIndex' with an argument list of type '(Int)'
//            
//            // iterate through the node children
//            for child in current.children {
//                if (child.key == searchKey) {
//                    childToUse = child
//                    break
//                }
//            }
//            
//            // create a new node
//            if (childToUse == nil) {
//                childToUse = TrieNode()
//                childToUse.key = searchKey
//                childToUse.level = current.level + 1
//                current.children.append(childToUse)
//            }
//            
//            current = childToUse
//        }
//        
//        // add final end of word check
//        if (keyword.length == current.level) {
//            current.isFinal = true
//            println("end of word reached!")
//            return
//        }
//    }
//    
//    // find all words based on a prefix
//    func findWord(keyword: String) -> Array<String>! {
//        if (keyword.length == 0) {
//            return nil
//        }
//        
//        var current: TrieNode = root
//        var searchKey: String!
//        var wordList: Array<String>! = Array<String>()
//        
//        while(keyword.length != current.level) {
//            var childToUse: TrieNode!
//            var searchKey = keyword.substringToIndex(current.level + 1)
//            
//            
//            // iterate through any children
//            for child in current.children {
//                if (child.key == searchKey) {
//                    childToUse = child
//                    current = childToUse
//                    break
//                }
//            }
//            
//            // prefix not found
//            if (childToUse == nil) {
//                return nil
//            }
//        }
//        
//        // retrieve keyword and any decendants
//        if ((current.key == keyword) && (current.isFinal)) {
//            wordList.append(current.key)
//        }
//        
//        // add children that are words
//        for child in current.children {
//            if (child.isFinal == true) {
//                wordList.append(child.key)
//            }
//        }
//        
//        return wordList
//    }
//}
//
//// extend the native String class
//extension String {
//    // compute the length of string
//    var length: Int {       // invalid redeclaration of 'length'
//        return Array(self).count
//    }
//    
//    // returns characters of a string up to a specified index
//    func substringToIndex(to: Int) -> String {
//        return self.substringToIndex(advance(self.startIndex, to))
//    }
//}

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