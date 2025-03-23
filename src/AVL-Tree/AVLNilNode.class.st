"
AVLNilNode is a special sentinel node used in AVL trees to represent the absence of a node.

In an AVL tree, `AVLNilNode` is used to represent the missing node. It serves as a placeholder for null references, making it easier to perform tree operations without having to deal with special cases for missing children.

`AVLNilNode` is a subclass of `AVLAbstractNode`, and it provides default implementations for methods that are specific to nil nodes, such as `addChild:` and `isNilNode`.

This class allows AVL trees to be implemented more cleanly and efficiently by treating missing nodes as instances of `AVLNilNode`.

Author: Milton Mamani
Date: October 20, 2023
"
Class {
	#name : 'AVLNilNode',
	#superclass : 'AVLAbstractNode',
	#category : 'AVL-Tree',
	#package : 'AVL-Tree'
}

{ #category : 'adding' }
AVLNilNode >> addChild: newObject [
	^ AVLNode with: newObject
]

{ #category : 'private' }
AVLNilNode >> checkRemovingPath: path [
]

{ #category : 'enumerating' }
AVLNilNode >> preorderDo: aBlock[
	"Do nothing for nil nodes"
]

{ #category : 'testing' }
AVLNilNode >> isNilNode [
	^ true
]