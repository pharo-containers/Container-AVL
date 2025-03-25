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
	#category : 'Containers-AVL-Tree',
	#package : 'Containers-AVL-Tree'
}

{ #category : 'adding' }
CTAVLAbstractNode >> addChild: newObject [
	^ self subclassResponsibility
]

{ #category : 'private' }
CTAVLAbstractNode >> checkRemovingPath: path [
	self subclassResponsibility
]

{ #category : 'accessing' }
CTAVLAbstractNode >> children [
	^ {  }
]

{ #category : 'enumerating' }
CTAVLAbstractNode >> do: aBlock [
]

{ #category : 'enumerating' }
CTAVLAbstractNode >> inorderDo: aBlock[
	"Evaluate aBlock for each node in inorder traversal (left, root, right)"
	self subclassResponsibility
]

{ #category : 'enumerating' }[
CTAVLAbstractNode >> postorderDo: aBlock
	"Evaluate aBlock for each node in postorder traversal (left, right, root)"
	self subclassResponsibility
]

{ #category : 'enumerating' }[
CTAVLAbstractNode >> preorderDo: aBlock
	"Evaluate aBlock for each node in preorder traversal (root, left, right)"
	self subclassResponsibility
]

{ #category : 'accessing' }
CTAVLAbstractNode >> height [
	^ 0
]

{ #category : 'testing' }
CTAVLAbstractNode >> isBalanced [
	^ true
]

{ #category : 'testing' }
CTAVLAbstractNode >> isNilNode [
	^ false
]

{ #category : 'testing' }
CTAVLAbstractNode >> isTotalBalanced [
	^ true
]

{ #category : 'removing' }
CTAVLAbstractNode >> remove: anObject path: list [
	^ nil
]

{ #category : 'accessing' }
CTAVLAbstractNode >> withAllChildren: aCollection [ 
]