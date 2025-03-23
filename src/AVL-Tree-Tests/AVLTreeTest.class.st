"
An AVLTest is a test class for testing the behavior of AVL
"
Class {
	#name : #AVLTreeTest,
	#superclass : #TestCase,
	#instVars : [
		'tree'
	],
	#category : #'AVL-Tree-Tests'
}

{ #category : #running }
AVLTreeTest >> setUp [
	super setUp.
	tree := AVLTree new
]

{ #category : #tests }
AVLTreeTest >> testAddForLLrotation [
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
AVLTreeTest >> testAddForRRrotation [
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
AVLTreeTest >> testAddOneElement [
	tree add: 1.
	self assert: tree isNotEmpty.
	self assert: (tree includes: 1)
]

{ #category : #tests }
AVLTreeTest >> testAddTreeElements [
	tree addAll: { 2. 4. 10 }.
	self assert: (tree includes: 2).
	self assert: (tree includes: 4).
	self assert: (tree includes: 10)
]

{ #category : #tests }
AVLTreeTest >> testAllChildren [
	| allChildren |
	allChildren := tree allChildren.
	self assert: allChildren isEmpty.
	tree addAll: { 4. 2. 3. 10 }.
	allChildren := tree allChildren.
	self assert: allChildren size equals: 4.
	self assert: allChildren first class equals: AVLNode
]

{ #category : #tests }
AVLTreeTest >> testEmpty [
	self assert: tree isEmpty
]

{ #category : #tests }
AVLTreeTest >> testHeight [
	self assert: tree height equals: 0.
	tree add: 4.
	self assert: tree height equals: 1.
	tree add: 2.
	self assert: tree height equals: 2.
	tree add: 10.
	self assert: tree height equals: 2
]

{ #category : #tests }
AVLTreeTest >> testInorderDoEmptyTree
	"Test inorder traversal on an empty tree"
	| result |
	result := OrderedCollection new.
	tree inorderDo: [ :each | result add: each ].
	self assert: result isEmpty
]

{ #category : #tests }
AVLTreeTest >> testInorderDoSingleElement
	"Test inorder traversal with one element"
	| result |
	tree add: 5.
	result := OrderedCollection new.
	tree inorderDo: [ :each | result add: each ].
	self assert: result asArray equals: #(5)
]

{ #category : #tests }
AVLTreeTest >> testInorderDoMultipleElements
	"Test inorder traversal with multiple elements"
	| result |
	tree addAll: #(4 2 6 1 3 5 7).
	result := OrderedCollection new.
	tree inorderDo: [ :each | result add: each ].
	self assert: result asArray equals: #(1 2 3 4 5 6 7)
]

{ #category : #tests }
AVLTreeTest >> testInorderDoAfterRotation
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
AVLTreeTest >> testIsBalanced [
	self assert: tree isBalanced.
	tree add: 4.
	self assert: tree isBalanced.
	tree add: 2.
	self assert: tree isBalanced.
	tree add: 10.
	self assert: tree isBalanced
]

{ #category : #tests }
AVLTreeTest >> testIsLeaf [
	self assert: tree isNil.
	tree add: 1.
	self assert: tree isLeaf.
	
	tree add: 10.
	self deny: tree isLeaf.
	
	tree:= AVLTree new.
	tree add: 10.
	tree add: 5.
	self deny: tree isLeaf.
]

{ #category : #tests }
AVLTreeTest >> testPostorderDoEmptyTree
	"Test postorder traversal on an empty tree"
	| result |
	result := OrderedCollection new.
	tree postorderDo: [ :each | result add: each ].
	self assert: result isEmpty
]

{ #category : #tests }
AVLTreeTest >> testPostorderDoSingleElement
	"Test postorder traversal with one element"
	| result |
	tree add: 5.
	result := OrderedCollection new.
	tree postorderDo: [ :each | result add: each ].
	self assert: result asArray equals: #(5)
]

{ #category : #tests }
AVLTreeTest >> testPostorderDoMultipleElements
	"Test postorder traversal with multiple elements"
	| result |
	tree addAll: #(4 2 6 1 3 5 7).
	result := OrderedCollection new.
	tree postorderDo: [ :each | result add: each ].
	self assert: result asArray equals: #(1 3 2 5 7 6 4)
]

{ #category : #tests }
AVLTreeTest >> testPostorderDoAfterRotation
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
AVLTreeTest >> testPreorderDoEmptyTree
	"Test preorder traversal on an empty tree"
	| result |
	result := OrderedCollection new.
	tree preorderDo: [ :each | result add: each ].
	self assert: result isEmpty
]

{ #category : #tests }
AVLTreeTest >> testPreorderDoSingleElement
	"Test preorder traversal with one element"
	| result |
	tree add: 5.
	result := OrderedCollection new.
	tree preorderDo: [ :each | result add: each ].
	self assert: result asArray equals: #(5)
]

{ #category : #tests }
AVLTreeTest >> testPreorderDoMultipleElements
	"Test preorder traversal with multiple elements"
	| result |
	tree addAll: #(4 2 6 1 3 5 7).
	result := OrderedCollection new.
	tree preorderDo: [ :each | result add: each ].
	self assert: result asArray equals: #(4 2 1 3 6 5 7)
]

{ #category : #tests }
AVLTreeTest >> testPreorderDoAfterRotation
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
AVLTreeTest >> testRemove [
	tree addAll: { 9. 4. 16. 7. 13. 19. 15 }.
	tree add: 10.
	tree add: 14.
	tree add: 11.
	tree remove: 13.
	self assert: tree isTotalBalanced
]

{ #category : #tests }
AVLTreeTest >> testRemoveBranchWithOneChild [
	tree addAll: { 9. 4. 16. 13. 15 }.
	tree add: 14.
	tree remove: 9.
	self deny: (tree includes: 9).
	self assert: (tree includes: 14)
]

{ #category : #tests }
AVLTreeTest >> testRemoveBranchWithTwoChildren [
	tree addAll: { 9. 4. 16. 13. 15. 10 }.
	tree add: 14.
	tree remove: 15.
	self deny: (tree includes: 15).
	self assert: (tree includes: 14).
	self assert: (tree includes: 16)
]

{ #category : #tests }
AVLTreeTest >> testRemoveBranchWithTwoChildren2 [
	tree addAll: { 9. 4. 16. 13. 15. 10. 14. 20 }.
	tree remove: 15.
	self deny: (tree includes: 15).
	self assert: (tree includes: 20).
	self assert: (tree includes: 14).
	self assert: (tree includes: 16)
]

{ #category : #tests }
AVLTreeTest >> testRemoveBranchWithTwoChildren3 [
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
AVLTreeTest >> testRemoveRootChildren [
	tree addAll: { 9 }.
	tree remove: 9.
	self assert: tree isEmpty
]

{ #category : #tests }
AVLTreeTest >> testRemoveRootChildren1 [
	tree addAll: { 9. 7. 10 }.
	tree remove: 10.
	self assert: tree size equals: 2.
	self assert: (tree includes: 9).
	self assert: (tree includes: 7)
]

{ #category : #tests }
AVLTreeTest >> testRemoveRootChildren2 [
	tree addAll: { 9. 7 }.
	tree remove: 7.
	self assert: tree size equals: 1.
	self assert: (tree includes: 9)
]

{ #category : #tests }
AVLTreeTest >> testRemoveRootChildren3 [
	tree addAll: { 9. 7. 10 }.
	tree remove: 9.
	self assert: tree size equals: 2.
	self deny: (tree includes: 9).
	self assert: (tree includes: 10).
	self assert: (tree includes: 7)
]

{ #category : #tests }
AVLTreeTest >> testRemoveZero [
	| value |
	value := false.
	tree remove: 1 ifAbsent: [ value := true ].
	self assert: value
]

{ #category : #tests }
AVLTreeTest >> testSearch [
	tree addAll: { 4. 2. 3. 10 }.
	self assert: (tree search: 5) isNil.
	self assert: (tree search: 4) equals: 4.
	self assert: (tree search: 2) equals: 2.
	self assert: (tree search:10) equals: 10
]

{ #category : #tests }
AVLTreeTest >> testSeriousAdd [
	tree addAll: { 9. 4. 16. 7. 13. 19. 15 }.
	self assert: tree isBalanced.
	tree add: 10.
	self assert: tree isBalanced.
	tree add: 14.
	self assert: tree isBalanced
]

{ #category : #tests }
AVLTreeTest >> testSeriousRandomAdd [
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
AVLTreeTest >> testSeriousRandomRemove [
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