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
CTAVLNilNode >> addChild: newObject [
	^ self parent replace: self with: (CTAVLNode with: newObject)
]

{ #category : 'private' }
CTAVLNilNode >> checkRemovingPath: path [
	"Do nothing for nil node"
]

{ #category : 'accessing' }
CTAVLNilNode >> children [
	^ #()
]

{ #category : 'enumerating' }
CTAVLNilNode >> childrenDo: aBlock [
	"Do nothing for nil node"
]

{ #category : 'enumerating' }
CTAVLNilNode >> do: aBlock [
	"Do nothing for nil node"
]

{ #category : 'accessing' }
CTAVLNilNode >> height [
	^ 0
]

{ #category : 'testing' }
CTAVLNilNode >> isBalanced [
	^ true
]

{ #category : 'testing' }
CTAVLNilNode >> isTotalBalanced [
	^ true
]

{ #category : 'accessing' }
CTAVLNilNode >> nodeSize [
	^ 0
]

{ #category : 'removing' }
CTAVLNilNode >> remove: anObject path: list [
	^ nil
]

{ #category : 'accessing' }
CTAVLNilNode >> withAllChildren: aCollection [
	"Do nothing for nil node"
]