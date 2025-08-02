"
AVLAbstractNode is an abstract class that represents a node in an AVL tree.

AVL trees are self-balancing binary search trees. This abstract node class is designed to be subclassed by concrete AVL node classes. It provides common methods and instance variables that are essential for maintaining the balance of the AVL tree.

Subclasses of AVLAbstractNode should implement methods for adding, removing, and manipulating nodes in the tree to ensure that the tree remains balanced.

Subclasses:
- AVLNilNode
- AVLNode

Author: Milton Mamani
Date: October 20, 2023
"
Class {
	#name : 'CTAVLAbstractNode',
	#superclass : 'Object',
	#instVars : [
		'parent'
	],
	#category : 'Containers-AVL-Tree',
	#package : 'Containers-AVL-Tree'
}

{ #category : 'adding' }
CTAVLAbstractNode >> addChild: anObject [

	^ self subclassResponsibility
]

{ #category : 'accessing' }
CTAVLAbstractNode >> balanceFactor [

	^ self subclassResponsibility 
]

{ #category : 'accessing' }
CTAVLAbstractNode >> contents [

	^ self subclassResponsibility 
]

{ #category : 'accessing' }
CTAVLAbstractNode >> contents: anObject [

	^ self subclassResponsibility 
]

{ #category : 'searching' }
CTAVLAbstractNode >> findMax [

	^ self subclassResponsibility 
]

{ #category : 'searching' }
CTAVLAbstractNode >> findMin [

	^ self subclassResponsibility 
]

{ #category : 'accessing' }
CTAVLAbstractNode >> height [

	^ self subclassResponsibility 
]

{ #category : 'enumerating' }
CTAVLAbstractNode >> inOrderDo: aBlock [

	^ self subclassResponsibility
]

{ #category : 'testing' }
CTAVLAbstractNode >> isEmpty [

	^ self subclassResponsibility
]

{ #category : 'testing' }
CTAVLAbstractNode >> isLeaf [ 

	^ self subclassResponsibility 
]

{ #category : 'accessing' }
CTAVLAbstractNode >> parent [

	^ parent 
]

{ #category : 'accessing' }
CTAVLAbstractNode >> parent: aNode [

	parent := aNode
]

{ #category : 'enumerating' }
CTAVLAbstractNode >> postOrderDo: aBlock [

	^ self subclassResponsibility 
]

{ #category : 'enumerating' }
CTAVLAbstractNode >> preOrderDo: aBlock [

	^ self subclassResponsibility 
]

{ #category : 'removing' }
CTAVLAbstractNode >> removeValue: anObject [

	^ self subclassResponsibility 
]

{ #category : 'accessing' }
CTAVLAbstractNode >> search: anObject [

	^ self subclassResponsibility
]

{ #category : 'accessing' }
CTAVLAbstractNode >> size [

	^ self subclassResponsibility 
]

{ #category : 'validation' }
CTAVLAbstractNode >> validateAsRoot [

	^ self subclassResponsibility 
]

{ #category : 'validation' }
CTAVLAbstractNode >> validateWithMin: min max: max [

	^ self subclassResponsibility 
]
