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
	#name : 'AVLTree',
	#superclass : 'Collection',
	#instVars : [
		'root'
	],
	#category : 'AVL-Tree',
	#package : 'AVL-Tree'
}

{ #category : #adding }
AVLTree >> add: newObject [
    newObject ifNil: [ Error signal: 'Cannot add nil to AVLTree' ].
    root := root addChild: newObject.
    ^ newObject
]

{ #category : #accessing }
AVLTree >> size [
	^ root isNilNode 
		ifTrue: [ 0 ]
		ifFalse: [ | count |
			count := 0.
			root do: [ :each | count := count + 1 ].
			count ]
]

{ #category : 'enumerating' }
AVLTree >> do: aBlock [ 
	root do: aBlock
]

{ #category : 'enumerating' }
AVLTree >> inorderDo: aBlock [
	root inorderDo: aBlock
]

{ #category : 'enumerating' }
AVLTree >> postorderDo: aBlock [
	root postorderDo: aBlock
]

{ #category : 'enumerating' }
AVLTree >> preorderDo: aBlock [
	root preorderDo: aBlock
]

{ #category : 'public' }
AVLTree >> height [
	^ root height
]

{ #category : 'testing' }
AVLTree >> includes: anObject [
	anObject ifNil: [ ^ nil ].
	^ (self search: anObject) notNil
]

{ #category : 'initialization' }
AVLTree >> initialize [
	super initialize.
	root := AVLNilNode new.
]

{ #category : 'testing' }
AVLTree >> isBalanced [
	^ root isBalanced
]

{ #category : 'search' }
AVLTree >> isLeaf [ 
	^ root isLeaf 
]

{ #category : 'search' }
AVLTree >> isNil [ 
	^ root isNilNode  
]

{ #category : 'testing' }
AVLTree >> isTotalBalanced [
	^ root isTotalBalanced
]

{ #category : 'removing' }
AVLTree >> remove: oldObject ifAbsent: anExceptionBlock [
	| toRemove path |
	path := OrderedCollection new.
	toRemove := root remove: oldObject path: path.
	toRemove ifNil: [ ^ anExceptionBlock value ].
	
	toRemove == root ifTrue: [ 
		root := root successor: path.
		root ifNil: [ root := AVLNilNode new ] ].
	root checkRemovingPath: path.
	
	^ toRemove contents
]

{ #category : 'search' }
AVLTree >> search: anInteger [ 
	^ root search: anInteger
]