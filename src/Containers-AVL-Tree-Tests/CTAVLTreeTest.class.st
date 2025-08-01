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
CTAVLTreeTest >> testAddMultipleElements [

	tree addAll: #(50 30 70).
	self assert: tree size equals: 3
]

{ #category : 'tests' }
CTAVLTreeTest >> testAddSingleElement [

	tree add: 42.
	self deny: tree isEmpty.
	self assert: tree size equals: 1.
	self assert: tree height equals: 1
]

{ #category : 'tests' }
CTAVLTreeTest >> testAsArray [

	tree addAll: #(50 30 70 20 40).
	self assert: tree asArray equals: #(20 30 40 50 70)
]

{ #category : 'tests' }
CTAVLTreeTest >> testClear [

	tree clear.
	self assert: tree isEmpty.
	self assert: tree size equals: 0
]

{ #category : 'tests' }
CTAVLTreeTest >> testDuplicateHandling [

	tree addAll: #(42 42 50).
	self assert: tree size equals: 2
]

{ #category : 'tests' }
CTAVLTreeTest >> testEmpty [

	self assert: tree isEmpty.
	self assert: tree size equals: 0.
	self assert: tree height equals: 0
]

{ #category : 'tests' }
CTAVLTreeTest >> testFindMinMax [

	self assert: tree findMin isNil.
	self assert: tree findMax isNil.
	
	tree addAll: #(50 30 70 20 80).
	self assert: tree findMin equals: 20.
	self assert: tree findMax equals: 80
]

{ #category : 'tests' }
CTAVLTreeTest >> testHeight [

	self assert: tree height equals: 0.
	
	tree add: 50.
	self assert: tree height equals: 1.
	
	tree addAll: #(30 70).
	self assert: tree height equals: 2
]

{ #category : 'tests' }
CTAVLTreeTest >> testInOrderTraversal [

	| result |
	tree addAll: #(50 30 70 20 40).
	
	result := OrderedCollection new.
	tree inOrderDo: [ :each | result add: each ].
	
	self assert: result asArray equals: #(20 30 40 50 70)
]

{ #category : 'tests' }
CTAVLTreeTest >> testIncludes [
	
	tree addAll: #(50 30 70 20 40).
	
	self assert: (tree includes: 50).
	self assert: (tree includes: 30).
	self deny: (tree includes: 99)
]
