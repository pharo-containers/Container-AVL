"
AVLNilNode is a special sentinel node used in AVL trees to represent the absence of a node.

In an AVL tree, `AVLNilNode` is used to represent the missing node. It serves as a placeholder for null references, making it easier to perform tree operations without having to deal with special cases for missing children.

`AVLNilNode` is a subclass of `AVLAbstractNode`, and it provides default implementations for methods that are specific to nil nodes, such as `addChild:` and `isNilNode`.

This class allows AVL trees to be implemented more cleanly and efficiently by treating missing nodes as instances of `AVLNilNode`.

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
	^ CTAVLNode with: newObject
]

{ #category : 'private' }
CTAVLNilNode >> checkRemovingPath: path [
]

{ #category : 'enumerating' }
CTAVLNilNode >> inorderDo: aBlock [
	"Empty implementation for nil node"
]

{ #category : 'enumerating' }
CTAVLNilNode >> postorderDo: aBlock [
	"Empty implementation for nil node"
]

{ #category : 'enumerating' }
CTAVLNilNode >> preorderDo: aBlock [
	"Empty implementation for nil node"
]

{ #category : 'testing' }
CTAVLNilNode >> isNilNode [
	^ true
]