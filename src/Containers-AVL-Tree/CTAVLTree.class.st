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

{ #category : 'enumerating' }
CTAVLTree >> anySatisfy: aBlock [

	self inOrderDo: [ :each |
		(aBlock value: each) ifTrue: [ ^ true ]
	].
	^ false
]

{ #category : 'converting' }
CTAVLTree >> asArray [

	| result |
	result := OrderedCollection new: self size.
	self inOrderDo: [ :each | result add: each ].
	^ result asArray
]

{ #category : 'accessing' }
CTAVLTree >> at: anObject ifAbsent: aBlock [

	| result |
	result := root search: anObject.
	^ result ifNil: [ aBlock value ] ifNotNil: [ result ]
]

{ #category : 'removing' }
CTAVLTree >> clear [

	root := CTAVLNilNode new
]

{ #category : 'enumerating' }
CTAVLTree >> collect: aBlock [

	| result |
	result := OrderedCollection new: self size.
	self inOrderDo: [ :each | result add: (aBlock value: each) ].
	^ result
]

{ #category : 'enumerating' }
CTAVLTree >> detect: aBlock ifNone: absentBlock [

	self inOrderDo: [ :each |
		(aBlock value: each) ifTrue: [ ^ each ]
	].
	^ absentBlock value
]

{ #category : 'enumerating' }
CTAVLTree >> do: aBlock [

	"Alias for inOrderDo: - visits elements in sorted order"
	self inOrderDo: aBlock
]

{ #category : 'enumerating' }
CTAVLTree >> elementsFrom: min to: max [ 

	| result |
	min > max ifTrue: [ ^ #() ].
	result := OrderedCollection new.
	root elementsFrom: min to: max into: result.
	^ result
]

{ #category : 'enumerating' }
CTAVLTree >> elementsGreaterThan: anObject [

	| result |
	result := OrderedCollection new.
	root elementsGreaterThan: anObject into: result.
	^ result
]

{ #category : 'enumerating' }
CTAVLTree >> elementsLessThan: anObject [

	| result |
	result := OrderedCollection new.
	root elementsLessThan: anObject into: result.
	^ result
]

{ #category : 'searching' }
CTAVLTree >> findMax [

	^ self isEmpty
		ifTrue: [ nil ]
		ifFalse: [ root findMax ]
]

{ #category : 'searching' }
CTAVLTree >> findMaxNode [

	^ self isEmpty
		ifTrue: [ nil ]
		ifFalse: [ root findMaxNode ]
]

{ #category : 'searching' }
CTAVLTree >> findMin [

	^ self isEmpty
		ifTrue: [ nil ]
		ifFalse: [ root findMin ]
]

{ #category : 'searching' }
CTAVLTree >> findMinNode [

	^ self isEmpty
		ifTrue: [ nil ]
		ifFalse: [ root findMinNode ]
]

{ #category : 'accessing' }
CTAVLTree >> first [

	^ self findMin 
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
CTAVLTree >> last [
	
	^ self findMax
]

{ #category : 'enumerating' }
CTAVLTree >> postOrderDo: aBlock [

	root postOrderDo: aBlock
]

{ #category : 'enumerating' }
CTAVLTree >> preOrderDo: aBlock [

	root preOrderDo: aBlock
]

{ #category : 'searching' }
CTAVLTree >> predecessorOf: anObject [

	^ root predecessorOf: anObject
]

{ #category : 'removing' }
CTAVLTree >> remove: anObject [

	^ self
		remove: anObject
		ifAbsent: [ NotFound signalFor: anObject in: self ]
]

{ #category : 'removing' }
CTAVLTree >> remove: anObject ifAbsent: aBlock [

	(self includes: anObject) ifFalse: [ ^ aBlock value ].
	root := root removeValue: anObject.
	root parent: nil.
	^ anObject
]

{ #category : 'accessing' }
CTAVLTree >> root [

	^ root isEmpty ifTrue: [ nil ] ifFalse: [ root ]
]

{ #category : 'enumerating' }
CTAVLTree >> select: aBlock [

	| result |
	result := OrderedCollection new.
	self inOrderDo: [ :each | (aBlock value: each) ifTrue: [ result add: each ] ].
	^ result
]

{ #category : 'accessing' }
CTAVLTree >> size [ 
	^ root size
]

{ #category : 'searching' }
CTAVLTree >> successorOf: anObject [

	^ root successorOf: anObject
]

{ #category : 'accessing' }
CTAVLTree >> validate [

	"Validate that the tree maintains both BST and AVL properties"
	^ root validateAsRoot
]
