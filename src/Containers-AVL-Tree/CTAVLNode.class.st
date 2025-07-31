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
	^ self
]

{ #category : 'accessing' }
CTAVLNode >> contents [

	^ contents
]

{ #category : 'accessing' }
CTAVLNode >> contents: anObject [

	contents := anObject
]

{ #category : 'accessing' }
CTAVLNode >> height [

	^ height 
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

{ #category : 'accessing' }
CTAVLNode >> right [

	^ right
]

{ #category : 'accessing' }
CTAVLNode >> right: aNode [

	right := aNode.
	aNode ifNotNil: [ aNode parent: self ]
]

{ #category : 'accessing' }
CTAVLNode >> size [

	^ 1 + left size + right size
]
