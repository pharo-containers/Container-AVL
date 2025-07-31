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

{ #category : 'accessing' }
CTAVLNilNode >> height [ 
	
	^ 0
]

{ #category : 'testing' }
CTAVLNilNode >> isEmpty [

	^ true
]

{ #category : 'accessing' }
CTAVLNilNode >> size [

	^ 0
]
