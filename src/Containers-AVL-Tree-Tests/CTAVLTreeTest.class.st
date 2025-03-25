"
A CTAVLTreeTest is a test class for testing the behavior of CTAVLTree
"
Class {
	#name : #CTAVLTreeTest,
	#superclass : #TestCase,
	#instVars : [
		'tree'
	],
	#category : #'Containers-AVL-Tree-Tests',
	#package : 'Containers-AVL-Tree-Tests'
}

{ #category : #running }
CTAVLTreeTest >> setUp [
	super setUp.
	tree := CTAVLTree new
]

{ #category : #tests }
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

{ #category : #tests }
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

{ #category : #tests }
CTAVLTreeTest >> testAddOneElement [
	tree add: 1.
	self assert: tree isNotEmpty.
	self assert: (tree includes: 1)
]

{ #category : #tests }
CTAVLTreeTest >> testAddTreeElements [
	tree addAll: { 2. 4. 10 }.
	self assert: (tree includes: 2).
	self assert: (tree includes: 4).
	self assert: (tree includes: 10)
]

{ #category : #tests }
CTAVLTreeTest >> testAllChildren [
	| allChildren |
	allChildren := tree allChildren.
	self assert: allChildren isEmpty.
	tree addAll: { 4. 2. 3. 10 }.
	allChildren := tree allChildren.
	self assert: allChildren size equals: 4.
	self assert: allChildren first class equals: CTAVLNode
]

{ #category : #tests }
CTAVLTreeTest >> testEmpty [
	self assert: tree isEmpty
]

{ #category : #tests }
CTAVLTreeTest >> testHeight [
	self assert: tree height equals: 0.
	tree add: 4.
	self assert: tree height equals: 1.
	tree add: 2.
	self assert: tree height equals: 2.
	tree add: 10.
	self assert: tree height equals: 2
]

{ #category : #tests }
CTAVLTreeTest >> testInorderDoEmptyTree [
	"Test inorder traversal on an empty tree"
	| result |
	result := OrderedCollection new.
	tree inorderDo: [ :each | result add: each ].
	self assert: result isEmpty
]

{ #category : #tests }
CTAVLTreeTest >> testInorderDoSingleElement [
	"Test inorder traversal with one element"
	| result |
	tree add: 5.
	result := OrderedCollection new.
	tree inorderDo: [ :each | result add: each ].
	self assert: result asArray equals: #(5)
]

{ #category : #tests }
CTAVLTreeTest >> testInorderDoMultipleElements [
	"Test inorder traversal with multiple elements"
	| result |
	tree addAll: #(4 2 6 1 3 5 7).
	result := OrderedCollection new.
	tree inorderDo: [ :each | result add: each ].
	self assert: result asArray equals: #(1 2 3 4 5 6 7)
]

{ #category : #tests }
CTAVLTreeTest >> testInorderDoAfterRotation [
	"Test inorder traversal after a rotation"
	| result |
	tree add: 3.
	tree add: 2.
	tree add: 1. "Triggers LL rotation"
	result := OrderedCollection new.
	tree inorderDo: [ :each | result add: each ].
	self assert: result asArray equals: #(1 2 3)
]

{ #category : #tests }
CTAVLTreeTest >> testIsBalanced [
	self assert: tree isBalanced.
	tree add: 4.
	self assert: tree isBalanced.
	tree add: 2.
	self assert: tree isBalanced.
	tree add: 10.
	self assert: tree isBalanced
]

{ #category : #tests }
CTAVLTreeTest >> testIsLeaf [
	self assert: tree isNil.
	tree add: 1.
	self assert: tree isLeaf.
	
	tree add: 10.
	self deny: tree isLeaf.
	
	tree := CTAVLTree new.
	tree add: 10.
	tree add: 5.
	self deny: tree isLeaf.
]

{ #category : #tests }
CTAVLTreeTest >> testPostorderDoEmptyTree [
	"Test postorder traversal on an empty tree"
	| result |
	result := OrderedCollection new.
	tree postorderDo: [ :each | result add: each ].
	self assert: result isEmpty
]

{ #category : #tests }
CTAVLTreeTest >> testPostorderDoSingleElement [
	"Test postorder traversal with one element"
	| result |
	tree add: 5.
	result := OrderedCollection new.
	tree postorderDo: [ :each | result add: each ].
	self assert: result asArray equals: #(5)
]

{ #category : #tests }
CTAVLTreeTest >> testPostorderDoMultipleElements [
	"Test postorder traversal with multiple elements"
	| result |
	tree addAll: #(4 2 6 1 3 5 7).
	result := OrderedCollection new.
	tree postorderDo: [ :each | result add: each ].
	self assert: result asArray equals: #(1 3 2 5 7 6 4)
]

{ #category : #tests }
CTAVLTreeTest >> testPostorderDoAfterRotation [
	"Test postorder traversal after a rotation"
	| result |
	tree add: 3.
	tree add: 2.
	tree add: 1. "Triggers LL rotation"
	result := OrderedCollection new.
	tree postorderDo: [ :each | result add: each ].
	self assert: result asArray equals: #(1 3 2)
]

{ #category : #tests }
CTAVLTreeTest >> testPreorderDoEmptyTree [
	"Test preorder traversal on an empty tree"
	| result |
	result := OrderedCollection new.
	tree preorderDo: [ :each | result add: each ].
	self assert: result isEmpty
]

{ #category : #tests }
CTAVLTreeTest >> testPreorderDoSingleElement [
	"Test preorder traversal with one element"
	| result |
	tree add: 5.
	result := OrderedCollection new.
	tree preorderDo: [ :each | result add: each ].
	self assert: result asArray equals: #(5)
]

{ #category : #tests }
CTAVLTreeTest >> testPreorderDoMultipleElements [
	"Test preorder traversal with multiple elements"
	| result |
	tree addAll: #(4 2 6 1 3 5 7).
	result := OrderedCollection new.
	tree preorderDo: [ :each | result add: each ].
	self assert: result asArray equals: #(4 2 1 3 6 5 7)
]

{ #category : #tests }
CTAVLTreeTest >> testPreorderDoAfterRotation [
	"Test preorder traversal after a rotation"
	| result |
	tree add: 3.
	tree add: 2.
	tree add: 1. "Triggers LL rotation"
	result := OrderedCollection new.
	tree preorderDo: [ :each | result add: each ].
	self assert: result asArray equals: #(2 1 3)
]

{ #category : #tests }
CTAVLTreeTest >> testRemove [
	tree addAll: { 9. 4. 16. 7. 13. 19. 15 }.
	tree add: 10.
	tree add: 14.
	tree add: 11.
	tree remove: 13.
	self assert: tree isTotalBalanced
]

{ #category : #tests }
CTAVLTreeTest >> testRemoveBranchWithOneChild [
	tree addAll: { 9. 4. 16. 13. 15 }.
	tree add: 14.
	tree remove: 9.
	self deny: (tree includes: 9).
	self assert: (tree includes: 14)
]

{ #category : #tests }
CTAVLTreeTest >> testRemoveBranchWithTwoChildren [
	tree addAll: { 9. 4. 16. 13. 15. 10 }.
	tree add: 14.
	tree remove: 15.
	self deny: (tree includes: 15).
	self assert: (tree includes: 14).
	self assert: (tree includes: 16)
]

{ #category : #tests }
CTAVLTreeTest >> testRemoveBranchWithTwoChildren2 [
	tree addAll: { 9. 4. 16. 13. 15. 10. 14. 20 }.
	tree remove: 15.
	self deny: (tree includes: 15).
	self assert: (tree includes: 20).
	self assert: (tree includes: 14).
	self assert: (tree includes: 16)
]

{ #category : #tests }
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

{ #category : #tests }
CTAVLTreeTest >> testRemoveRootChildren [
	tree addAll: { 9 }.
	tree remove: 9.
	self assert: tree isEmpty
]

{ #category : #tests }
CTAVLTreeTest >> testRemoveRootChildren1 [
	tree addAll: { 9. 7. 10 }.
	tree remove: 10.
	self assert: tree size equals: 2.
	self assert: (tree includes: 9).
	self assert: (tree includes: 7)
]

{ #category : #tests }
CTAVLTreeTest >> testRemoveRootChildren2 [
	tree addAll: { 9. 7 }.
	tree remove: 7.
	self assert: tree size equals: 1.
	self assert: (tree includes: 9)
]

{ #category : #tests }
CTAVLTreeTest >> testRemoveRootChildren3 [
	tree addAll: { 9. 7. 10 }.
	tree remove: 9.
	self assert: tree size equals: 2.
	self deny: (tree includes: 9).
	self assert: (tree includes: 10).
	self assert: (tree includes: 7)
]

{ #category : #tests }
CTAVLTreeTest >> testRemoveZero [
	| value |
	value := false.
	tree remove: 1 ifAbsent: [ value := true ].
	self assert: value
]

{ #category : #tests }
CTAVLTreeTest >> testSearch [
	tree addAll: { 4. 2. 3. 10 }.
	self assert: (tree search: 5) isNil.
	self assert: (tree search: 4) equals: 4.
	self assert: (tree search: 2) equals: 2.
	self assert: (tree search: 10) equals: 10
]

{ #category : #tests }
CTAVLTreeTest >> testSeriousAdd [
	tree addAll: { 9. 4. 16. 7. 13. 19. 15 }.
	self assert: tree isBalanced.
	tree add: 10.
	self assert: tree isBalanced.
	tree add: 14.
	self assert: tree isBalanced
]

{ #category : #tests }
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

{ #category : #tests }
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