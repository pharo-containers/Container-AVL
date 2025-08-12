"
I represent a node in an AVL Tree.
I extend the functionality of a standard BST node by storing my height and performing self-balancing rotations after any modification (add or remove) to ensure the tree's height balance is maintained.
The AVL invariant I maintain is: |height(left) - height(right)| <= 1
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
CTAVLNode >> children [

	^ { left . right }
]

{ #category : 'accessing' }
CTAVLNode >> contents [

	^ contents
]

{ #category : 'accessing' }
CTAVLNode >> contents: anObject [

	contents := anObject
]

{ #category : 'enumerating' }
CTAVLNode >> elementsFrom: min to: max into: aCollection [

	contents > min ifTrue: [
		left elementsFrom: min to: max into: aCollection ].
	(contents between: min and: max) ifTrue: [ aCollection add: contents ].
	contents < max ifTrue: [
		right elementsFrom: min to: max into: aCollection ]
]

{ #category : 'enumerating' }
CTAVLNode >> elementsGreaterThan: anObject into: aCollection [

	contents > anObject ifTrue: [
		left elementsGreaterThan: anObject into: aCollection.
		aCollection add: contents ].
	right elementsGreaterThan: anObject into: aCollection
]

{ #category : 'enumerating' }
CTAVLNode >> elementsLessThan: anObject into: aCollection [

	left elementsLessThan: anObject into: aCollection.
	contents < anObject ifFalse: [ ^ self ].
	aCollection add: contents.
	right elementsLessThan: anObject into: aCollection
]

{ #category : 'searching' }
CTAVLNode >> findMax [

	^ right isEmpty
		ifTrue: [ contents ]
		ifFalse: [ right findMax ]
]

{ #category : 'searching' }
CTAVLNode >> findMaxNode [ 

	^ right isEmpty
		ifTrue: [ self ]
		ifFalse: [ right findMaxNode ]
]

{ #category : 'searching' }
CTAVLNode >> findMin [

	^ left isEmpty
		ifTrue: [ contents ]
		ifFalse: [ left findMin ]
]

{ #category : 'searching' }
CTAVLNode >> findMinNode [ 

	^ left isEmpty
		ifTrue: [ self ]
		ifFalse: [ left findMinNode ]
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
CTAVLNode >> isBalanced [

	^ (left height - right height) abs <= 1
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

{ #category : 'enumerating' }
CTAVLNode >> postOrderDo: aBlock [

	left postOrderDo: aBlock.
	right postOrderDo: aBlock.
	aBlock value: contents
]

{ #category : 'enumerating' }
CTAVLNode >> preOrderDo: aBlock [

	aBlock value: contents.
	left preOrderDo: aBlock.
	right preOrderDo: aBlock
]

{ #category : 'searching' }
CTAVLNode >> predecessorOf: anObject [

	| rightResult |
	anObject <= contents ifTrue: [
		^ left predecessorOf: anObject ].
	rightResult := right predecessorOf: anObject.
	^ rightResult ifNil: [ contents ] ifNotNil: [ rightResult ]
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

{ #category : 'private' }
CTAVLNode >> removeThisNode [

	"Handle removal of the current node, then rebalance."
	| successorValue |
	"Case 1 & 2: Leaf or one child"
	left isEmpty ifTrue: [ ^ right ].
	right isEmpty ifTrue: [ ^ left ].
	"Case 3: Two children"
	successorValue := right findMin.
	self contents: successorValue.
	self right: (right removeValue: successorValue).
	^ self updateHeightAndRebalance
]

{ #category : 'removing' }
CTAVLNode >> removeValue: anObject [

	anObject < contents ifTrue: [
		self left: (left removeValue: anObject).
		^ self updateHeightAndRebalance ].
	anObject > contents ifTrue: [
		self right: (right removeValue: anObject).
		^ self updateHeightAndRebalance ].
	"Found the node to remove"
	^ self removeThisNode
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

{ #category : 'searching' }
CTAVLNode >> successorOf: anObject [

	| leftResult |
	anObject >= contents ifTrue: [
		^ right successorOf: anObject ].
	leftResult := left successorOf: anObject.
	^ leftResult ifNil: [ contents ] ifNotNil: [ leftResult ]
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
