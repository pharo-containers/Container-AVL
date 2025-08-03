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
CTAVLTreeTest >> testAnySatisfy [

	tree addAll: #(50 30 70 20 40).
	
	self assert: (tree anySatisfy: [ :each | each > 60 ]).
	self deny: (tree anySatisfy: [ :each | each > 100 ])
]

{ #category : 'tests' }
CTAVLTreeTest >> testAsArray [

	tree addAll: #(50 30 70 20 40).
	self assert: tree asArray equals: #(20 30 40 50 70)
]

{ #category : 'tests' }
CTAVLTreeTest >> testAtIfAbsent [

	tree addAll: #(50 30 70).
	self assert: (tree at: 30 ifAbsent: [ #notFound ]) equals: 30.
	self assert: (tree at: 99 ifAbsent: [ #notFound ]) equals: #notFound
]

{ #category : 'tests' }
CTAVLTreeTest >> testClear [

	tree clear.
	self assert: tree isEmpty.
	self assert: tree size equals: 0
]

{ #category : 'tests' }
CTAVLTreeTest >> testCollect [

	| doubled |
	tree addAll: #(50 30 70 20 40).
	
	doubled := tree collect: [ :each | each * 2 ].
	self assert: doubled asArray equals: #(40 60 80 100 140)
]

{ #category : 'tests' }
CTAVLTreeTest >> testDetect [

	| found |
	tree addAll: #(50 30 70 20 40).
	
	found := tree detect: [ :each | each > 45 ] ifNone: [ nil ].
	self assert: found equals: 50.
	
	found := tree detect: [ :each | each > 100 ] ifNone: [ #none ].
	self assert: found equals: #none
]

{ #category : 'tests' }
CTAVLTreeTest >> testDoMethod [

	| result |
	tree addAll: #(50 30 70 20 40).
	
	result := OrderedCollection new.
	tree do: [ :each | result add: each ].
	
	self assert: result asArray equals: #(20 30 40 50 70)
]

{ #category : 'tests' }
CTAVLTreeTest >> testDuplicateHandling [

	tree addAll: #(42 42 50).
	self assert: tree size equals: 2
]

{ #category : 'tests' }
CTAVLTreeTest >> testElementsFromTo [

	| result |
	tree addAll: #(50 30 70 20 40 60 80).
	
	result := tree elementsFrom: 35 to: 65.
	self assert: result asArray equals: #(40 50 60).
	
	"Test edge cases"
	result := tree elementsFrom: 10 to: 15.
	self assert: result isEmpty.
	
	result := tree elementsFrom: 65 to: 35. "Invalid range"
	self assert: result isEmpty
]

{ #category : 'tests' }
CTAVLTreeTest >> testElementsGreaterThan [

	| result |
	tree addAll: #(50 30 70 20 40 60 80).
	
	result := tree elementsGreaterThan: 45.
	self assert: result asArray equals: #(50 60 70 80).
	
	result := tree elementsGreaterThan: 80.
	self assert: result isEmpty
]

{ #category : 'tests' }
CTAVLTreeTest >> testElementsLessThan [

	| result |
	tree addAll: #(50 30 70 20 40 60 80).
	
	result := tree elementsLessThan: 45.
	self assert: result asArray equals: #(20 30 40).
	
	result := tree elementsLessThan: 20.
	self assert: result isEmpty
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
CTAVLTreeTest >> testFindMinMaxNode [

	tree addAll: #(50 30 70 20 80).
	
	self assert: tree findMinNode contents equals: 20.
	self assert: tree findMaxNode contents equals: 80
]

{ #category : 'tests' }
CTAVLTreeTest >> testFirstLast [

	tree addAll: #(50 30 70 20 80).
	self assert: tree first equals: 20.
	self assert: tree last equals: 80
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

{ #category : 'tests' }
CTAVLTreeTest >> testLLRotation [

	tree add: 3.
	tree add: 2.
	tree add: 1.
	
	self assert: tree root contents equals: 2.
	self assert: tree asArray equals: #(1 2 3)
]

{ #category : 'tests' }
CTAVLTreeTest >> testLRRotation [

	tree add: 3.
	tree add: 1.
	tree add: 2.
	
	self assert: tree root contents equals: 2.
	self assert: tree asArray equals: #(1 2 3)
]

{ #category : 'tests' }
CTAVLTreeTest >> testPostOrderTraversal [

	| result |
	tree addAll: #(50 30 70 20).
	result := OrderedCollection new.
	tree postOrderDo: [ :each | result add: each ].
	self assert: result last equals: tree root contents
]

{ #category : 'tests' }
CTAVLTreeTest >> testPreOrderTraversal [

	| result |
	tree addAll: #(50 30 70 20).
	result := OrderedCollection new.
	tree preOrderDo: [ :each | result add: each ].
	self assert: result first equals: tree root contents
]

{ #category : 'tests' }
CTAVLTreeTest >> testPredecessorSuccessor [

	tree addAll: #(50 30 70 20 40 60 80).
	
	self assert: (tree predecessorOf: 50) equals: 40.
	self assert: (tree predecessorOf: 20) isNil.
	self assert: (tree successorOf: 50) equals: 60.
	self assert: (tree successorOf: 80) isNil.
	
	"Test with non-existent element"
	self assert: (tree predecessorOf: 35) equals: 30.
	self assert: (tree successorOf: 35) equals: 40
]

{ #category : 'tests' }
CTAVLTreeTest >> testRLRotation [

	tree add: 1.
	tree add: 3.
	tree add: 2.
	
	self assert: tree root contents equals: 2.
	self assert: tree asArray equals: #(1 2 3)
]

{ #category : 'tests' }
CTAVLTreeTest >> testRRRotation [

	tree add: 1.
	tree add: 2.
	tree add: 3.
	
	self assert: tree root contents equals: 2.
	self assert: tree asArray equals: #(1 2 3)
]

{ #category : 'tests' }
CTAVLTreeTest >> testRemoveLeafNode [

	tree addAll: #(50 30 70 20).
	
	tree remove: 20.
	self assert: tree size equals: 3.
	self deny: (tree includes: 20).
	self assert: tree validate
]

{ #category : 'tests' }
CTAVLTreeTest >> testRemoveNodeWithOneChild [

	tree addAll: #(50 30 20).
	tree remove: 30.
	self assert: tree size equals: 2.
	self deny: (tree includes: 30).
	self assert: (tree includes: 20).
	self assert: tree validate
]

{ #category : 'tests' }
CTAVLTreeTest >> testRemoveNodeWithTwoChildren [

		tree addAll: #(50 30 70 20 40).
	
	tree remove: 30.
	self assert: tree size equals: 4.
	self deny: (tree includes: 30).
	self assert: tree validate
]

{ #category : 'tests' }
CTAVLTreeTest >> testRemoveNonExistentElement [

	| result |
	tree addAll: #(50 30 70).
	result := tree remove: 99 ifAbsent: [ #notFound ].
	self assert: result equals: #notFound.
	self assert: tree size equals: 3.
	
	self should: [ tree remove: 99 ] raise: Error
]

{ #category : 'tests' }
CTAVLTreeTest >> testRemoveRoot [

	tree addAll: #(50 30 70 20 40 60 80).
	tree remove: 50.
	self assert: tree size equals: 6.
	self deny: (tree includes: 50).
	self assert: tree validate
]

{ #category : 'tests' }
CTAVLTreeTest >> testSelect [

	| evens |
	tree addAll: #(50 30 70 20 40).
	
	evens := tree select: [ :each | each even ].
	self assert: evens asArray equals: #(20 30 40 50 70)
]

{ #category : 'tests' }
CTAVLTreeTest >> testValidation [

	self assert: tree validate.
	
	tree addAll: #(50 30 70 20 40).
	self assert: tree validate.
	
	"Test after operations"
	tree add: 60.
	self assert: tree validate
]
