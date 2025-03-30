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
		'right'
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
CTAVLNode >> add: anInteger path: list [
	anInteger < contents ifTrue: [ 
		list add: false -> left.
		left := left addChild: anInteger.
	] ifFalse: [ 
		list add: true -> right.
		right := right addChild: anInteger.
	]
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
	^ { left. right }
]

{ #category : 'accessing' }
CTAVLNode >> allChildren [
	"Collects all child nodes recursively."
	| children |
	children := OrderedCollection new.
	self left ifNotNil: [children addAll: self left allChildren].
	self right ifNotNil: [children addAll: self right allChildren].
	children add: self.
	^ children.
]

{ #category : 'enumerating' }
CTAVLNode >> childrenDo: aBlock [
	left childrenDo: aBlock.
	right childrenDo: aBlock.
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
CTAVLNode >> do: aBlock [
	left do: aBlock.
	aBlock value: self contents.
	right do: aBlock.
]

{ #category : 'testing' }
CTAVLNode >> hasNoChildren [
	^ left nodeSize = 0 and: [ right nodeSize = 0 ]
]

{ #category : 'accessing' }
CTAVLNode >> height [
	^ (left height max: right height) + 1
]

{ #category : 'testing' }
CTAVLNode >> isBalanced [
	^ (left height - right height) abs <= 1
]

{ #category : 'testing' }
CTAVLNode >> isTotalBalanced [
	^ self isBalanced 
		and: [ left isTotalBalanced 
			and: [ right isTotalBalanced ] ]
]

{ #category : 'accessing' }
CTAVLNode >> largerNode [
	| size1 size2 isLeft |
	size1 := left height.
	size2 := right height.
	isLeft := size1 > size2.
	^ isLeft not -> (isLeft ifTrue: [ left ] ifFalse: [ right ])
]

{ #category : 'accessing' }
CTAVLNode >> left [
	^ left
]

{ #category : 'accessing' }
CTAVLNode >> left: aNode [ 
	left := aNode.
	aNode parent: self
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

{ #category : 'accessing' }
CTAVLNode >> nodeSize [
	^ 1 + left nodeSize + right nodeSize
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
		isLeft := anObject < contents.
		node := isLeft ifTrue: [ left ] ifFalse: [ right ].
		list add: self.
		nodeToRemove := node remove: anObject path: list.
		nodeToRemove == node ifTrue: [
			| successor |
			successor := node successor: list.
			isLeft 
				ifTrue: [ left := successor ]
				ifFalse: [ right := successor ]
		].
		^ nodeToRemove
	].
]

{ #category : 'removing' }
CTAVLNode >> removeMinimum: list [
	| res |
	left nodeSize = 0 ifTrue: [
		res := self class with: contents.
		contents := right contents.
		left := right left.
		right := right right ]
	ifFalse: [ 
		list add: self.
		left hasNoChildren ifTrue: [
			res := left.
			left := CTAVLNilNode new ]
		ifFalse: [ res := left removeMinimum: list ] ].
	^ res
]

{ #category : 'accessing' }
CTAVLNode >> right [
	^ right
]

{ #category : 'accessing' }
CTAVLNode >> right: aNode [ 
	right := aNode.
	aNode parent: self 
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
	| a1 a2 new |
	a1 := z left.
	a2 := y left.
	
	new := self class with: z contents.
	new left: a1; right: a2.
	z left: new; right: x; contents: y contents
]

{ #category : 'search' }
CTAVLNode >> search: anInteger [ 
	contents = anInteger ifTrue: [ ^ contents ].
	^ (anInteger < contents ifTrue: [ left ] ifFalse: [ right ]) search: anInteger
]

{ #category : 'removing' }
CTAVLNode >> successor: list [
	^ self hasNoChildren
		ifTrue: [ CTAVLNilNode new ]
		ifFalse: [ 
			(left nodeSize > 0 and: [ right nodeSize > 0 ]) ifTrue: [ 
				right hasNoChildren
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
				list add: (left nodeSize = 0 ifTrue: [ right ] ifFalse: [ left ]) ] ]
]

{ #category : 'accessing' }
CTAVLNode >> withAllChildren: aCollection [ 
	aCollection add: self.
	self childrenDo: [ :child | child withAllChildren: aCollection ]
]