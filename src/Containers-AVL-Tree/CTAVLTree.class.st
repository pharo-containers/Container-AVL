"
I represent an AVL Tree, a self-balancing binary search tree.
I maintain the BST property (left < node < right) while also ensuring that the height difference between the left and right subtrees of any node is at most 1. This balancing act guarantees O(log n) worst-case performance for all primary operations.
My public API is designed to be polymorphic with CTBinarySearchTree and includes a rich set of collection methods for enumeration, searching, and accessing.
Usage:
    tree := CTAVLTree new.
    tree addAll: #(50 30 70 20 40 60 80).
    tree asArray. => #(20 30 40 50 60 70 80)
    tree height. => 3
    tree first. => 20
    tree includes: 30. => true
    tree elementsFrom: 30 to: 60. => #(30 40 50 60)
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

{ #category : 'accessing' }
CTAVLTree >> allChildren [

	| currentNode nodesToVisit children |
	children := Set new.
	nodesToVisit := LinkedList with: root.

	[ nodesToVisit isNotEmpty ] whileTrue: [ 
		currentNode := nodesToVisit removeFirst.
		children add: currentNode.
		nodesToVisit addAll: (currentNode children reject: #isNilNode) ].

	^ children
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

{ #category : 'copying' }
CTAVLTree >> copy [

	| newTree |
	newTree := self class new.
	self inOrderDo: [ :each | newTree add: each ].
	^ newTree
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

{ #category : 'testing' }
CTAVLTree >> ifEmpty: aBlock [

	^ self isEmpty
		ifTrue: [ aBlock value ]
		ifFalse: [ self ]
]

{ #category : 'testing' }
CTAVLTree >> ifNotEmpty: aBlock [

	^ self isEmpty
		ifFalse: [ aBlock value: self ]
		ifTrue: [ self ]
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

{ #category : 'removing' }
CTAVLTree >> removeAll: aCollection [

	aCollection do: [ :each | self remove: each ifAbsent: [ ] ].
	^ aCollection
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
