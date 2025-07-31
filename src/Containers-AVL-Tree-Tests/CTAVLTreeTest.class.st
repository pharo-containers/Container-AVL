"
An AVLTest is a test class for testing the behavior of AVL
"
Class {
	#name : 'CTAVLTreeTest',
	#superclass : 'TestCase',
	#instVars : [
		'tree'
	],
	#category : 'Containers-AVL-Tree-Tests',
	#package : 'Containers-AVL-Tree-Tests'
}

{ #category : 'running' }
CTAVLTreeTest >> setUp [
	
	super setUp.
	tree := CTAVLTree new
]

{ #category : 'tests' }
CTAVLTreeTest >> testClear [

	tree clear.
	self assert: tree isEmpty.
	self assert: tree size equals: 0
]

{ #category : 'tests' }
CTAVLTreeTest >> testEmpty [

	self assert: tree isEmpty.
	self assert: tree size equals: 0.
	self assert: tree height equals: 0
]
