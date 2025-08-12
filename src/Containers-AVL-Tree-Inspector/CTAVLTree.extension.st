Extension { #name : 'CTAVLTree' }

{ #category : '*Containers-AVL-Tree-Inspector' }
CTAVLTree >> inspectorCanvas: aBuilder [

	<inspectorPresentationOrder: 90 title: 'AVL'>
	^ (aBuilder instantiate: SpRoassalInspectorPresenter)
		  canvas: (CTAVLTreeVisualizer new
				   tree: self;
				   build;
				   canvas);
		  yourself
]
