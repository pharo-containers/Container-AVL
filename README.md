# Containers-AVL-Tree

A self-balancing AVL Tree implementation providing guaranteed O(log n) performance for all operations. Features automatic rebalancing, range queries, and full Collection protocol compliance.

![Pharo Version](https://img.shields.io/badge/Pharo-10+-blue)
[![License: MIT](https://img.shields.io/badge/License-MIT-green.svg)](LICENSE)

## What is an AVL Tree?

An AVL Tree is a self-balancing binary search tree where the height difference between left and right subtrees of any node is at most 1. This guarantees O(log n) worst-case performance for all operations, unlike regular BSTs which can degrade to O(n).

To install `Container-AVL`, go to the Playground (Ctrl+OW) in your [Pharo](https://pharo.org/) image and execute the following Metacello script (select it and press Do-it button or Ctrl+D):

```smalltalk
Metacello new
  baseline: 'ContainersAVLTree';
  repository: 'github://pharo-containers/Container-AVL/src';
  load
```

## How to depend on it

```smalltalk
spec 
   baseline: 'ContainersAVLTree' 
   with: [ spec repository: 'github://pharo-containers/Container-AVL/src' ].
```

## Why use Containers-AVL-Tree?

AVL Trees maintain sorted data with guaranteed efficient operations, perfect for applications requiring consistent performance regardless of input order.

### Key Benefits
- **Guaranteed Performance**: O(log n) worst-case for all operations
- **Self-Balancing**: Automatic rebalancing through rotations
- **Ordered Iteration**: Automatic sorted traversal
- **Range Queries**: Efficient retrieval of value ranges

## Basic Usage

```smalltalk
"Create and populate an AVL Tree"
tree := CTAVLTree new.
tree addAll: #(50 30 70 20 40 60 80).

"Search operations"
tree includes: 30. "=> true"
tree findMin. "=> 20"
tree findMax. "=> 80"

"Range queries"
tree elementsFrom: 35 to: 65. "=> #(40 50 60)"

"Tree automatically stays balanced"
tree validate. "=> true"
tree height. "=> 3 (logarithmic height)"
```

## Real-World Use Case

```smalltalk
"Order book for trading system - needs guaranteed fast operations"
orderBook := CTAVLTree new.
orderBook addAll: #(100.50 100.75 100.25 101.00 99.75).

"Fast operations regardless of market conditions"
bestPrice := orderBook findMax. "=> 101.00"
competitivePrices := orderBook elementsGreaterThan: 100.40.
"=> #(100.50 100.75 101.00)"

"Remove filled orders - tree rebalances automatically"
orderBook remove: 101.00.
orderBook validate. "=> still perfectly balanced"
```

## Performance Advantage

AVL Trees excel with sorted or nearly-sorted data where regular BSTs fail:

```smalltalk
"Worst case for regular BST: sorted input"
sortedData := 1 to: 10000.

avlTree := CTAVLTree new.
avlTree addAll: sortedData.
avlTree height. "=> ~14 (logarithmic)"

"Regular BST would have height 10000 (linear)!"
```

## Contributing

This is part of the Pharo Containers project. Feel free to contribute by implementing additional methods, improving tests, or enhancing documentation.