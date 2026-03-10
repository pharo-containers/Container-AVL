Class {
	#name : 'CTAVLNodeTest',
	#superclass : 'TestCase',
	#category : 'Containers-AVL-Tree-Tests',
	#package : 'Containers-AVL-Tree-Tests'
}

{ #category : 'tests' }
CTAVLNodeTest >> testCopyLeafNode [
	| node copiedNode |
	node := CTAVLNode new contents: 42.
	
	copiedNode := node copy.
	
	self assert: copiedNode contents equals: 42.
	self deny: node == copiedNode.
	
	self assert: copiedNode height equals: 1.
	self assert: copiedNode left isNilNode.
	self assert: copiedNode right isNilNode
]

{ #category : 'tests' }
CTAVLNodeTest >> testIsLeaf [
    | parentNode childNode |
    parentNode := CTAVLNode new contents: 50.
    self assert: parentNode isLeaf.

    childNode := CTAVLNode new contents: 30.
    parentNode left: childNode.

    self deny: parentNode isLeaf.
    self assert: childNode isLeaf.
]

{ #category : 'tests' }
CTAVLNodeTest >> testParentChildRelationships [
    | root leftChild rightChild |
    root := CTAVLNode new contents: 50.
    leftChild := CTAVLNode new contents: 30.
    rightChild := CTAVLNode new contents: 70.

    root left: leftChild.
    root right: rightChild.

    self assert: root parent isNil.
    self assert: leftChild parent equals: root.
    self assert: rightChild parent equals: root.
]
