Class {
	#name : 'CTAVLTreeInspectorTest',
	#superclass : 'TestCase',
	#category : 'Containers-AVL-Tree-Inspector',
	#package : 'Containers-AVL-Tree-Inspector'
}

{ #category : 'tests' }
CTAVLTreeInspectorTest >> testCreateCanvas [

	| tree presenter |
	tree := tree := CTAVLTree new.
	tree addAll: { 4. 2. 3. 10 }.
	
	presenter := tree inspectorCanvas: CTMockSpecBuilder new.
	self assert: presenter isPresenter.
	self assert: presenter canvas nodes size equals: tree size.
]

{ #category : 'tests' }
CTAVLTreeInspectorTest >> testTree [
	
    |visualizer tree |
    tree := CTAVLTree new.
    visualizer := CTAVLTreeVisualizer new.
    visualizer tree: tree.
    
    self assert: (visualizer tree) equals: tree.
]
