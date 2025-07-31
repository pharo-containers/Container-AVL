"
AVLTree is an implementation of a self-balancing AVL (Adelson-Velsky and Landis) binary search tree.

An AVL tree is a binary search tree in which the heights of the two child subtrees of every node differ by at most one. This self-balancing property ensures that the tree remains approximately balanced, leading to efficient insertion, deletion, and search operations. The instances of `AVLTree` uses AVLNode to manage the overall structure of the AVL tree =,

`AVLTree` is a generic tree that can store comparable objects. It uses `AVLNode` instances to represent the nodes within the tree. 

Usage:
    To use `AVLTree`, create an instance of the class and then use the provided methods to insert, remove, or search for elements within the tree. The tree will automatically self-balance as elements are added or removed.

Example:
```
| tree |
tree := AVLTree new.
tree add: 41.
tree add: 87.
tree add: 20.
tree remove: 87.
tree
```
Author: Milton
Date: October 20, 2023
"
Class {
	#name : 'CTAVLTree',
	#superclass : 'Object',
	#instVars : [
		'root'
	],
	#category : 'Containers-AVL-Tree',
	#package : 'Containers-AVL-Tree'
}

{ #category : 'removing' }
CTAVLTree >> clear [

	root := CTAVLNilNode new
]

{ #category : 'accessing' }
CTAVLTree >> height [

	^ root height
]

{ #category : 'initialization' }
CTAVLTree >> initialize [

	super initialize.
	root := CTAVLNilNode new
]

{ #category : 'testing' }
CTAVLTree >> isEmpty [

	^ root isEmpty
]

{ #category : 'accessing' }
CTAVLTree >> size [ 
	^ root size
]
