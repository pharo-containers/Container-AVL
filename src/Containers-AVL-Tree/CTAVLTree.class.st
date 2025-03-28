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
	#superclass : 'Collection',
	#instVars : [
		'root'
	],
	#category : 'Containers-AVL-Tree',
	#package : 'Containers-AVL-Tree'
}

{ #category : 'adding' }
CTAVLTree >> add: newObject [
    root := root addChild: newObject.
    ^ newObject
]

{ #category : 'enumerating' }
CTAVLTree >> do: aBlock [ 
	root do: aBlock
]

{ #category : 'testing' }
CTAVLTree >> hasNoChildren [ 
	^ root nodeSize = 0
]

{ #category : 'public' }
CTAVLTree >> height [
	^ root height
]

{ #category : 'testing' }
CTAVLTree >> includes: anObject [
	anObject ifNil: [ ^ false ].
	^ (self search: anObject) notNil
]

{ #category : 'initialization' }
CTAVLTree >> initialize [
	super initialize.
	root := CTAVLNilNode new.
]

{ #category : 'testing' }
CTAVLTree >> isBalanced [
	^ root isBalanced
]

{ #category : 'testing' }
CTAVLTree >> isTotalBalanced [
	^ root isTotalBalanced
]

{ #category : 'removing' }
CTAVLTree >> remove: oldObject ifAbsent: anExceptionBlock [
	| toRemove path |
	path := OrderedCollection new.
	toRemove := root remove: oldObject path: path.
	toRemove ifNil: [ ^ anExceptionBlock value ].
	
	toRemove == root ifTrue: [ 
		root := root successor: path.
		root ifNil: [ root := CTAVLNilNode new ] ].
	root checkRemovingPath: path.
	
	^ toRemove contents
]

{ #category : 'search' }
CTAVLTree >> search: anInteger [ 
	^ root search: anInteger
]

{ #category : 'accessing' }
CTAVLTree >> size [
	^ root nodeSize
]

{ #category : 'accessing' }
CTAVLTree >> root [
	^ root
]