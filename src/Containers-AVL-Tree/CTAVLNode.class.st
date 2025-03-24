"
AVLNode represents a node in an AVL tree.

An AVL tree is a self-balancing binary search tree where the heights of the two child subtrees of every node differ by at most one. The `AVLNode` class extends the `AVLAbstractNode` class and provides the implementation of actual nodes within the AVL tree.

AVLNode instances hold a `contents` instance variable. These nodes are organized in such a way that the tree remains balanced, ensuring efficient operations like insertion, deletion, and search.

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
		'right'
	],
	#category : 'Containers-AVL-Tree',
	#package : 'Containers-AVL-Tree'
}

{ #category : 'instance creation' }
CTAVLNode class >> with: anInteger [ 
	^ self new
		contents: anInteger;
		yourself
]

{ #category : 'adding' }
CTAVLNode >> add: anInteger path: list [
	anInteger < contents  ifTrue: [ 
		left 
			ifNil: [ 
				left := self class with: anInteger.
				list add: false -> left ]
			ifNotNil: [ 
				list add: false -> left.
				left add: anInteger path: list ]
	] ifFalse: [ 
		right 
			ifNil: [ 
				right := self class with: anInteger.
				list add: true -> right ]
			ifNotNil: [ 
				list add: true -> right.
				right add: anInteger path: list ] ]
	
]

{ #category : 'adding' }
CTAVLNode >> addChild: newObject [
	| path |
	path := OrderedCollection with: nil -> self.
	self add: newObject path: path.
	self checkPath: path.
	^ self
]

{ #category : 'private' }
CTAVLNode >> balance: index path: aCollection [ 
	| x y z a b c |
	z := aCollection at: index.
	y := aCollection at: index + 1.
	x := aCollection at: index + 2.
	c := z value.
	b := y value.
	a := x value.
	(y key and: [ x key ]) ifTrue: [ 
		^ self rrrotationZ: c y: b x: a ].
	(y key not and: [ x key not ]) ifTrue: [ 
		^ self llrotationZ: c y: b x: a ].
	(y key not and: [ x key ]) ifTrue: [ 
		^ self lrrotationZ: c y: b x: a ].
	"(y key and: [ x key not ])"
	^ self rlrotationZ: c y: b x: a.
	"self notYetImplemented."
]

{ #category : 'private' }
CTAVLNode >> balanceZ: z y: y x: x [
	| a b c |
	c := z value.
	b := y value.
	a := x value.
	(y key and: [ x key ]) ifTrue: [ 
		^ self rrrotationZ: c y: b x: a ].
	(y key not and: [ x key not ]) ifTrue: [ 
		^ self llrotationZ: c y: b x: a ].
	(y key not and: [ x key ]) ifTrue: [ 
		^ self lrrotationZ: c y: b x: a ].
	"(y key and: [ x key not ])"
	^ self rlrotationZ: c y: b x: a.
	"self notYetImplemented."
]

{ #category : 'private' }
CTAVLNode >> checkPath: aCollection [ 
	aCollection size < 3 ifTrue: [ ^ self ].
	(1 to: aCollection size - 2) reverseDo: [ :index |
		| assoc |
		assoc := aCollection at: index.
		assoc value isBalanced ifFalse: [ | z y x |
			z := aCollection at: index.
			y := aCollection at: index + 1.
			x := aCollection at: index + 2.
			^ self balanceZ: z y: y x: x ] ]
]

{ #category : 'private' }
CTAVLNode >> checkRemovingPath: path [
	path reverseDo: [ :node | 
		node isBalanced ifFalse: [ | z y x |
			z := node.
			y := z largerNode.
			x := y value largerNode.
			self balanceZ: node y: y x: x ] ].
]

{ #category : 'accessing' }
CTAVLNode >> children [
	^ { left. right } reject: #isNil
]

{ #category : 'enumerating' }
CTAVLNode >> childrenDo: aFullBlockClosure [ 
	left ifNotNil: aFullBlockClosure.
	right ifNotNil: aFullBlockClosure.
]

{ #category : 'accessing' }
CTAVLNode >> contents [
	^ contents
]

{ #category : 'accessing' }
CTAVLNode >> contents: anInteger [ 
	contents := anInteger
]

{ #category : 'enumerating' }
CTAVLNode >> do: aFullBlockClosure [ 
	left ifNotNil: [ left do: aFullBlockClosure ].
	aFullBlockClosure value: self contents.
	right ifNotNil: [ right do: aFullBlockClosure ].
]

{ #category : 'accessing' }
CTAVLNode >> height [
	| leftHeight rightHeight |
	leftHeight := left ifNil: [ 0 ] ifNotNil: [ left height ].
	rightHeight := right ifNil: [ 0 ] ifNotNil: [ right height ].
	^ (leftHeight max: rightHeight) + 1
	
]

{ #category : 'testing' }
CTAVLNode >> isBalanced [
	| leftHeight rightHeight |
	leftHeight := left ifNil: [ 0 ] ifNotNil: [ left height ].
	rightHeight := right ifNil: [ 0 ] ifNotNil: [ right height ].
	
	^ (leftHeight - rightHeight) abs <= 1
]

{ #category : 'testing' }
CTAVLNode >> isLeaf [
	^ left isNil and: [ right isNil ]
]

{ #category : 'testing' }
CTAVLNode >> isTotalBalanced [
	^ self isBalanced 
		and: [ (left isNil or: [ left isTotalBalanced ]) 
			and: [ right isNil or: [ right isTotalBalanced ] ] ]
		
		
]

{ #category : 'accessing' }
CTAVLNode >> largerNode [
	| size1 size2 isLeft |
	size1 := left ifNil: [ 0 ] ifNotNil: [ left height ].
	size2 := right ifNil: [ 0 ] ifNotNil: [ right height ].
	isLeft := size1 > size2.
	^ isLeft not -> (isLeft ifTrue: [ left ] ifFalse: [ right ])
]

{ #category : 'accessing' }
CTAVLNode >> left [
	^ left
]

{ #category : 'accessing' }
CTAVLNode >> left: aNode [ 
	left := aNode
]

{ #category : 'private' }
CTAVLNode >> llrotationZ: z y: y x: x [ 
	| a3 a4 new |
	a3 := y right.
	a4 := z right.
	
	new := self class with: z contents.
	new left: a3; right: a4.
	z left: x; contents: y contents; right: new.
	
]

{ #category : 'private' }
CTAVLNode >> lrrotationZ: z y: y x: x [ 
	| a1 a2 a3 new |
	a1 := y left.
	a2 := x left.
	a3 := x right.
	new := self class with: y contents.
	new left: a1; right: a2.
	y contents: x contents; left: new; right: a3.
	
	self llrotationZ: z y: y x: new
]

{ #category : 'printing' }
CTAVLNode >> printOn: stream [
	contents printOn: stream
]

{ #category : 'removing' }
CTAVLNode >> remove: anObject path: list [
	contents = anObject ifTrue: [
		^ self
	] ifFalse: [ 
		| node nodeToRemove isLeft |
		node := (isLeft := anObject < contents)
			ifTrue: [ left ]
			ifFalse: [ right ].
		node ifNil: [ ^ nil ].
		list add: self.
		nodeToRemove := node remove: anObject path: list.
		nodeToRemove == node ifTrue: [
			| successor |
			successor := node successor: list.
			isLeft 
				ifTrue: [ left := successor ]
				ifFalse: [ right := successor ]
		] .
		^ nodeToRemove
	].
]

{ #category : 'removing' }
CTAVLNode >> removeMinimum: list [
	| res |
	left ifNil: [
		res := self class with: contents.
		contents := right contents.
		left := right left.
		right := right right ]
	ifNotNil: [ 
		list add: self.
		left isLeaf ifTrue: [
			res := left.
			left := nil ]
		ifFalse: [ res := left removeMinimum: list ] ].
	^ res
]

{ #category : 'accessing' }
CTAVLNode >> right [
	^ right
]

{ #category : 'accessing' }
CTAVLNode >> right: anObject [ 
	right := anObject
]

{ #category : 'private' }
CTAVLNode >> rlrotationZ: z y: y x: x [ 
	| a1 a2 a3 a4 new |
	a1 := z left.
	a2 := x left.
	a3 := x right.
	a4 := y right.
	new := self class with: y contents.
	new left: a3; right: a4.
	y contents: x contents; left: a2; right: new.
	self rrrotationZ: z y: y x: new
]

{ #category : 'private' }
CTAVLNode >> rrrotationZ: z y: y x: x [
	"right right rotation"
	| a1 a2 new |
	a1 := z left.
	a2 := y left.
	
	new := self class with: z contents.
	new left: a1; right: a2.
	z left: new; right: x; contents: y contents
	
]

{ #category : 'search' }
CTAVLNode >> search: anInteger [ 
	^ contents = anInteger ifTrue: [
		contents
	] ifFalse: [
		| node |
		node := anInteger < contents
			ifTrue: [ left ]
			ifFalse: [ right ].
		node ifNil: [ nil ] ifNotNil: [ node search: anInteger ]
	]
]

{ #category : 'removing' }
CTAVLNode >> successor: list [
	^ self isLeaf
		ifTrue: [ nil ]
		ifFalse: [ 
			(left notNil and: [ right notNil ]) ifTrue: [ 
				right isLeaf
					ifTrue: [ list add: (right left: left; yourself) ]
					ifFalse: [ | min newList |
						newList := OrderedCollection new.
						min := right removeMinimum: newList.
						list add: min.
						list addAll: newList.
						min left: left.
						min right: right.
						right := min ]
			] ifFalse: [ 
				list add: (left ifNil: [ right ] ifNotNil: [ left ]) ] ].
		
]

{ #category : 'accessing' }
CTAVLNode >> withAllChildren: aCollection [ 
	aCollection add: self.
	self childrenDo: [ :child | child withAllChildren: aCollection ]
]
