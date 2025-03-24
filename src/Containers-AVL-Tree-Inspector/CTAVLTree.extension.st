Extension { #name : 'CTAVLTree' }

{ #category : '*Containers-AVL-Tree-Inspector' }
CTAVLTree >> inspectorCanvas [
	<inspectorPresentationOrder: 90 title: 'AVL'>
	^ CTAVLTreeVisualizer new
		tree: self;
		asPresenter
]
