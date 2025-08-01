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

{ #category : 'adding' }
CTAVLTree >> add: anObject [

	root := root addChild: anObject.
	root parent: nil.
	^ anObject
]

{ #category : 'adding' }
CTAVLTree >> addAll: aCollection [

	aCollection do: [ :each | self add: each ].
	^ aCollection
]

{ #category : 'converting' }
CTAVLTree >> asArray [

	| result |
	result := OrderedCollection new: self size.
	self inOrderDo: [ :each | result add: each ].
	^ result asArray
]

{ #category : 'removing' }
CTAVLTree >> clear [

	root := CTAVLNilNode new
]

{ #category : 'enumerating' }
CTAVLTree >> do: aBlock [

	"Alias for inOrderDo: - visits elements in sorted order"
	self inOrderDo: aBlock
]

{ #category : 'searching' }
CTAVLTree >> findMax [

	^ self isEmpty
		ifTrue: [ nil ]
		ifFalse: [ root findMax ]
]

{ #category : 'searching' }
CTAVLTree >> findMin [

	^ self isEmpty
		ifTrue: [ nil ]
		ifFalse: [ root findMin ]
]

{ #category : 'accessing' }
CTAVLTree >> height [

	^ root height
]

{ #category : 'enumerating' }
CTAVLTree >> inOrderDo: aBlock [

	root inOrderDo: aBlock
]

{ #category : 'testing' }
CTAVLTree >> includes: anObject [

	^ (root search: anObject) notNil
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
CTAVLTree >> root [

	^ root isEmpty ifTrue: [ nil ] ifFalse: [ root ]
]

{ #category : 'accessing' }
CTAVLTree >> size [ 
	^ root size
]
