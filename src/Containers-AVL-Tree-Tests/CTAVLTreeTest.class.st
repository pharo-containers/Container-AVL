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
CTAVLTreeTest >> testAddForLLrotation [

	| data |
	tree add: 3.
	self assert: tree isBalanced.
	tree add: 2.
	self assert: tree isBalanced.
	tree add: 1.
	self assert: tree isBalanced.
	data := tree collect: #yourself.
	self assert: data asArray equals: { 1. 2. 3 }
]

{ #category : 'tests' }
CTAVLTreeTest >> testAddForRRrotation [

	| data |
	tree add: 1.
	self assert: tree isBalanced.
	tree add: 2.
	self assert: tree isBalanced.
	tree add: 3.
	self assert: tree isBalanced.
	data := tree collect: #yourself.
	self assert: data asArray equals: { 1. 2. 3 }
]

{ #category : 'tests' }
CTAVLTreeTest >> testAddNilRaisesError [
    self should: [ tree add: nil ] raise: Error withExceptionDo: [ :ex |
        self assert: ex messageText equals: 'Cannot add nil to AVLTree' ]
]

{ #category : 'tests' }
CTAVLTreeTest >> testAddOneElement [

	tree add: 1.
	self assert: tree isNotEmpty.
	self assert: (tree includes: 1)
]

{ #category : 'tests' }
CTAVLTreeTest >> testAddTreeElements [

	tree addAll: { 2. 4. 10 }.
	self assert: (tree includes: 2).
	self assert: (tree includes: 4).
	self assert: (tree includes: 10)
]

{ #category : 'tests' }
CTAVLTreeTest >> testAllChildren [

	| allChildren |
	allChildren := tree allChildren.
	self assert: allChildren isEmpty.
	tree addAll: { 4. 2. 3. 10 }.
	allChildren := tree allChildren.
	self assert: allChildren size equals: 4.
	self assert: allChildren first class equals: CTAVLNode
]

{ #category : 'tests' }
CTAVLTreeTest >> testDuplicateElement [
    tree add: 42.
    "Adding the same element again should maintain balance"
    tree add: 42.
    self assert: tree isBalanced.
    "Removing one instance of the element should keep the other"
    tree remove: 42.
    self assert: (tree includes: 42).
    tree remove: 42.
    self assert: tree isEmpty
]

{ #category : 'tests' }
CTAVLTreeTest >> testEmpty [

	self assert: tree isEmpty
]

{ #category : 'tests' }
CTAVLTreeTest >> testHeight [

	self assert: tree height equals: 0.
	tree add: 4.
	self assert: tree height equals: 1.
	tree add: 2.
	self assert: tree height equals: 2.
	tree add: 10.
	self assert: tree height equals: 2
]

{ #category : 'tests' }
CTAVLTreeTest >> testIsBalanced [

	self assert: tree isBalanced.
	tree add: 4.
	self assert: tree isBalanced.
	tree add: 2.
	self assert: tree isBalanced.
	tree add: 10.
	self assert: tree isBalanced
]

{ #category : 'tests' }
CTAVLTreeTest >> testIsLeaf [

	self assert: tree isNil.
	tree add: 1.
	self assert: tree isLeaf.
	
	tree add: 10.
	self deny: tree isLeaf.
	
	tree:= CTAVLTree new.
	tree add: 10.
	tree add: 5.
	self deny: tree isLeaf.
]

{ #category : 'tests' }
CTAVLTreeTest >> testLRRotation [
    "Test LR rotation"
|data|
tree := CTAVLTree new.
tree add: 1.
tree add: 3.
tree add: 2.
self assert: tree isBalanced.
data := tree collect: #yourself.
self assert: data asArray equals: { 1. 2. 3 }.
]

{ #category : 'tests' }
CTAVLTreeTest >> testRemove [

	tree addAll: { 9. 4. 16. 7. 13. 19. 15 }.
	tree add: 10.
	tree add: 14.
	tree add: 11.
	tree remove: 13.
	self assert: tree isTotalBalanced
]

{ #category : 'tests' }
CTAVLTreeTest >> testRemoveBranchWithOneChild [

	tree addAll: { 9. 4. 16. 13. 15 }.
	tree add: 14.
	tree remove: 9.
	self deny: (tree includes: 9).
	self assert: (tree includes: 14)
]

{ #category : 'tests' }
CTAVLTreeTest >> testRemoveBranchWithTwoChildren [

	tree addAll: { 9. 4. 16. 13. 15. 10 }.
	tree add: 14.
	tree remove: 15.
	self deny: (tree includes: 15).
	self assert: (tree includes: 14).
	self assert: (tree includes: 16)
]

{ #category : 'tests' }
CTAVLTreeTest >> testRemoveBranchWithTwoChildren2 [

	tree addAll: { 9. 4. 16. 13. 15. 10. 14. 20 }.
	tree remove: 15.
	self deny: (tree includes: 15).
	self assert: (tree includes: 20).
	self assert: (tree includes: 14).
	self assert: (tree includes: 16)
]

{ #category : 'tests' }
CTAVLTreeTest >> testRemoveBranchWithTwoChildren3 [

	tree addAll: { 9. 4. 17. 13. 15. 10. 14. 20. 16 }.
	tree remove: 15.
	self deny: (tree includes: 15).
	self assert: (tree includes: 20).
	self assert: (tree includes: 14).
	self assert: (tree includes: 16).
	self assert: (tree includes: 17).
	self assert: tree isBalanced
]

{ #category : 'tests' }
CTAVLTreeTest >> testRemoveFromEmptyTree [
    | executed |
    executed := false.
    tree remove: 42 ifAbsent: [ executed := true ].
    self assert: executed description: 'The ifAbsent: block should execute when removing from an empty tree'.
    self assert: tree isEmpty description: 'Tree should remain empty after removal attempt'.
]

{ #category : 'tests' }
CTAVLTreeTest >> testRemoveRootChildren [

	tree addAll: { 9 }.
	tree remove: 9.
	self assert: tree isEmpty
]

{ #category : 'tests' }
CTAVLTreeTest >> testRemoveRootChildren1 [

	tree addAll: { 9. 7. 10 }.
	tree remove: 10.
	self assert: tree size equals: 2.
	self assert: (tree includes: 9).
	self assert: (tree includes: 7)
]

{ #category : 'tests' }
CTAVLTreeTest >> testRemoveRootChildren2 [

	tree addAll: { 9. 7 }.
	tree remove: 7.
	self assert: tree size equals: 1.
	self assert: (tree includes: 9)
]

{ #category : 'tests' }
CTAVLTreeTest >> testRemoveRootChildren3 [

	tree addAll: { 9. 7. 10 }.
	tree remove: 9.
	self assert: tree size equals: 2.
	self deny: (tree includes: 9).
	self assert: (tree includes: 10).
	self assert: (tree includes: 7)
]

{ #category : 'tests' }
CTAVLTreeTest >> testRemoveZero [

	| value |
	value := false.
	tree remove: 1 ifAbsent: [ value := true ].
	self assert: value
]

{ #category : 'tests' }
CTAVLTreeTest >> testSearch [

	tree addAll: { 4. 2. 3. 10 }.
	self assert: (tree search: 5) isNil.
	self assert: (tree search: 4) equals: 4.
	self assert: (tree search: 2) equals: 2.
	self assert: (tree search: 10) equals: 10
]

{ #category : 'tests' }
CTAVLTreeTest >> testSeriousAdd [

	tree addAll: { 9. 4. 16. 7. 13. 19. 15 }.
	self assert: tree isBalanced.
	tree add: 10.
	self assert: tree isBalanced.
	tree add: 14.
	self assert: tree isBalanced
]

{ #category : 'tests' }
CTAVLTreeTest >> testSeriousRandomAdd [

	| r size numbers |
	r := Random new.
	r seed: 1234.
	size := 50.
	numbers := (1 to: size) collect: [ :i | r nextInteger: size ].
	numbers := numbers asSet.
	numbers do: [ :n | 
		tree add: n.
		self assert: tree isBalanced ]
]

{ #category : 'tests' }
CTAVLTreeTest >> testSeriousRandomRemove [

	| r size numbers toRemove |
	r := Random new.
	r seed: 1234.
	size := 50.
	numbers := (1 to: size) collect: [ :i | r nextInteger: size ].
	numbers := numbers asSet.
	tree addAll: numbers.
	self assert: tree isTotalBalanced.
	toRemove := (1 to: 20) collect: [ :i | numbers atRandom: r ] as: Set.
	toRemove do: [ :number | 
		tree remove: number.
		self assert: tree isTotalBalanced ]
]

{ #category : 'tests' }
CTAVLTreeTest >> testSizeAfterRemoval [
	tree addAll: #(1 2 3 4 5).
	tree remove: 3.
	self assert: tree size equals: 4
]

{ #category : 'tests' }
CTAVLTreeTest >> testSizeEmpty [
	self assert: tree size equals: 0
]

{ #category : 'tests' }
CTAVLTreeTest >> testSizeMultipleElements [
	tree addAll: #(1 2 3 4 5).
	self assert: tree size equals: 5
]

{ #category : 'tests' }
CTAVLTreeTest >> testSizeOneElement [
	tree add: 42.
	self assert: tree size equals: 1
]
