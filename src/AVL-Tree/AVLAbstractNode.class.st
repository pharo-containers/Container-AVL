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
	#name : 'AVLAbstractNode',
	#superclass : 'Object',
	#category : 'AVL-Tree',
	#package : 'AVL-Tree'
}

{ #category : 'adding' }
AVLAbstractNode >> addChild: newObject [
	^ self subclassResponsibility
]

{ #category : 'private' }
AVLAbstractNode >> checkRemovingPath: path [
	self subclassResponsibility
]

{ #category : 'accessing' }
AVLAbstractNode >> children [
	^ {  }
]

{ #category : 'enumerating' }
AVLAbstractNode >> do: aBlock [
]

{ #category : 'enumerating' }
AVLAbstractNode >> preorderDo: aBlock[
	self subclassResponsibility
]

{ #category : 'accessing' }
AVLAbstractNode >> height [
	^ 0
]

{ #category : 'testing' }
AVLAbstractNode >> isBalanced [
	^ true
]

{ #category : 'testing' }
AVLAbstractNode >> isNilNode [
	^ false
]

{ #category : 'testing' }
AVLAbstractNode >> isTotalBalanced [
	^ true
]

{ #category : 'removing' }
AVLAbstractNode >> remove: anObject path: list [
	^ nil
]

{ #category : 'accessing' }
AVLAbstractNode >> withAllChildren: aCollection [ 
]