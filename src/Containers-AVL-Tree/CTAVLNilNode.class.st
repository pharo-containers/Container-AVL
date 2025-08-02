"
AVLNilNode is a special sentinel node used in AVL trees to represent the absence of a node.

In an AVL tree, `AVLNilNode` is used as a placeholder for null references, making it easier to perform tree operations without special cases for missing children. It fully implements the Null Object pattern.

Author: Milton Mamani
Date: October 20, 2023
"
Class {
	#name : 'CTAVLNilNode',
	#superclass : 'CTAVLAbstractNode',
	#category : 'Containers-AVL-Tree',
	#package : 'Containers-AVL-Tree'
}

{ #category : 'adding' }
CTAVLNilNode >> addChild: anObject [

	^ CTAVLNode new
		contents: anObject;
		parent: self parent;
		yourself
]

{ #category : 'accessing' }
CTAVLNilNode >> balanceFactor [

	^ 0
]

{ #category : 'accessing' }
CTAVLNilNode >> contents [

	^ nil
]

{ #category : 'accessing' }
CTAVLNilNode >> contents: anObject [

	"Do nothing for nil node"
]

{ #category : 'searching' }
CTAVLNilNode >> findMax [ 

	^ nil
]

{ #category : 'searching' }
CTAVLNilNode >> findMin [

	^ nil
]

{ #category : 'accessing' }
CTAVLNilNode >> height [ 
	
	^ 0
]

{ #category : 'enumerating' }
CTAVLNilNode >> inOrderDo: aBlock [

	"Do Nothing for Nil Node"
]

{ #category : 'testing' }
CTAVLNilNode >> isEmpty [

	^ true
]

{ #category : 'testing' }
CTAVLNilNode >> isLeaf [ 
	^ false
]

{ #category : 'enumerating' }
CTAVLNilNode >> postOrderDo: aBlock [

	"Do Nothing for Nil Node"
]

{ #category : 'enumerating' }
CTAVLNilNode >> preOrderDo: aBlock [

	"Do Nothing for Nil Node"
]

{ #category : 'removing' }
CTAVLNilNode >> removeValue: anObject [

	^ self 
]

{ #category : 'accessing' }
CTAVLNilNode >> search: anObject [

	^ nil
]

{ #category : 'accessing' }
CTAVLNilNode >> size [

	^ 0
]

{ #category : 'validation' }
CTAVLNilNode >> validateAsRoot [

	^ true
]

{ #category : 'validation' }
CTAVLNilNode >> validateWithMin: min max: max [

	^ true
]
