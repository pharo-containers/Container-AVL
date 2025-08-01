"
AVLNode represents a node in an AVL tree.

An AVL tree is a self-balancing binary search tree where the heights of the two child subtrees of every node differ by at most one. The `AVLNode` class extends the `AVLAbstractNode` class and provides the implementation of actual nodes within the AVL tree.

AVLNode instances hold a `contents` instance variable. These nodes are organized to keep the tree balanced, ensuring efficient operations like insertion, deletion, and search.

This class should not be used directly; instead use `AVLTree`.

Instance Variables:
- contents: The value associated with this node.
- left: The left child node.
- right: The right child node.

Author: Milton Mamani
Date: October 20, 2023
"
Class {
	#name : 'CTAVLNode',
	#superclass : 'CTAVLAbstractNode',
	#instVars : [
		'left',
		'contents',
		'right',
		'height'
	],
	#category : 'Containers-AVL-Tree',
	#package : 'Containers-AVL-Tree'
}

{ #category : 'instance creation' }
CTAVLNode class >> with: anInteger [ 
	^ self new
		contents: anInteger;
		left: CTAVLNilNode new;
		right: CTAVLNilNode new;
		yourself
]

{ #category : 'adding' }
CTAVLNode >> addChild: anObject [

	anObject < contents
		ifTrue: [ self left: (left addChild: anObject) ]
		ifFalse: [
			anObject > contents
				ifTrue: [ self right: (right addChild: anObject) ] ].
	^ self updateHeightAndRebalance
]

{ #category : 'accessing' }
CTAVLNode >> balanceFactor [

	^ left height - right height
]

{ #category : 'accessing' }
CTAVLNode >> contents [

	^ contents
]

{ #category : 'accessing' }
CTAVLNode >> contents: anObject [

	contents := anObject
]

{ #category : 'searching' }
CTAVLNode >> findMax [

	^ right isEmpty
		ifTrue: [ contents ]
		ifFalse: [ right findMax ]
]

{ #category : 'searching' }
CTAVLNode >> findMin [

	^ left isEmpty
		ifTrue: [ contents ]
		ifFalse: [ left findMin ]
]

{ #category : 'accessing' }
CTAVLNode >> height [

	^ height 
]

{ #category : 'enumerating' }
CTAVLNode >> inOrderDo: aBlock [

	left inOrderDo: aBlock.
	aBlock value: contents.
	right inOrderDo: aBlock
]

{ #category : 'initialization' }
CTAVLNode >> initialize [

	super initialize.
	left := CTAVLNilNode new parent: self.
	right := CTAVLNilNode new parent: self.
	height := 1
]

{ #category : 'testing' }
CTAVLNode >> isEmpty [

	^ false
]

{ #category : 'testing' }
CTAVLNode >> isLeaf [ 
	^ left isEmpty and: [ right isEmpty ]
]

{ #category : 'accessing' }
CTAVLNode >> left [

	^ left
]

{ #category : 'accessing' }
CTAVLNode >> left: aNode [

	left := aNode.
	aNode ifNotNil: [ aNode parent: self ]
]

{ #category : 'private' }
CTAVLNode >> rebalance [

	| bf |
	bf := self balanceFactor.
	"Left-heavy case"
	bf > 1 ifTrue: [
		"Left-Right case"
		(left balanceFactor < 0) ifTrue: [ self left: left rotateLeft ].
		^ self rotateRight ].
	"Right-heavy case"
	bf < -1 ifTrue: [
		"Right-Left case"
		(right balanceFactor > 0) ifTrue: [ self right: right rotateRight ].
		^ self rotateLeft ].
	^ self "Already balanced"
]

{ #category : 'accessing' }
CTAVLNode >> right [

	^ right
]

{ #category : 'accessing' }
CTAVLNode >> right: aNode [

	right := aNode.
	aNode ifNotNil: [ aNode parent: self ]
]

{ #category : 'private' }
CTAVLNode >> rotateLeft [

	| newRoot |
	newRoot := right.
	self right: newRoot left.
	newRoot left: self.
	self updateHeight.
	newRoot updateHeight.
	^ newRoot
]

{ #category : 'private' }
CTAVLNode >> rotateRight [

	| newRoot |
	newRoot := left.
	self left: newRoot right.
	newRoot right: self.
	self updateHeight.
	newRoot updateHeight.
	^ newRoot
]

{ #category : 'accessing' }
CTAVLNode >> search: anObject [

	contents = anObject ifTrue: [ ^ contents ].
	^ anObject < contents
		ifTrue: [ left search: anObject ]
		ifFalse: [ right search: anObject ]
]

{ #category : 'accessing' }
CTAVLNode >> size [

	^ 1 + left size + right size
]

{ #category : 'private' }
CTAVLNode >> updateHeight [

height := 1 + (left height max: right height)
]

{ #category : 'private' }
CTAVLNode >> updateHeightAndRebalance [

	self updateHeight.
	^ self rebalance
]

{ #category : 'validation' }
CTAVLNode >> validateAsRoot [

	^ self validateWithMin: nil max: nil
]

{ #category : 'validation' }
CTAVLNode >> validateWithMin: min max: max [

	"Check BST property"
	(min notNil and: [ contents < min ]) ifTrue: [ ^ false ].
	(max notNil and: [ contents > max ]) ifTrue: [ ^ false ].
	"Check AVL property"
	(self balanceFactor abs > 1) ifTrue: [ ^ false ].
	"Check height property"
	(self height = (1 + (left height max: right height))) ifFalse: [ ^ false ].
	"Recursively validate children"
	^ (left validateWithMin: min max: contents) and: [
		right validateWithMin: contents max: max ]
]
