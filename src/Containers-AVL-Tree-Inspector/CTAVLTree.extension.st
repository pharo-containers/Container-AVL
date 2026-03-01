Extension { #name : 'CTAVLTree' }

{ #category : '*Containers-AVL-Tree-Inspector' }
CTAVLTree >> allChildren [
	| allNodes queue currentNode |
	allNodes := OrderedCollection new.
	self root isNilNode ifTrue: [ ^ allNodes ].
	
	queue := OrderedCollection with: self root.
	[ queue isNotEmpty ] whileTrue: [ 
		currentNode := queue removeFirst.
		allNodes add: currentNode.
		currentNode left isNilNode ifFalse: [ queue add: currentNode left ].
		currentNode right isNilNode ifFalse: [ queue add: currentNode right ] 
	].
	
	^ allNodes
]

{ #category : '*Containers-AVL-Tree-Inspector' }
CTAVLTree >> inspectorCanvas: aBuilder [
	<inspectorPresentationOrder: 90 title: 'AVL'>
	
	self size > 10000 ifTrue: [ 
		^ aBuilder newText 
			text: 'Tree is too large to render graphically (', self size asString, ' nodes). Please use the Tree tab.';
			yourself ].
			
	^ (aBuilder instantiate: SpRoassalInspectorPresenter)
		canvas: (CTAVLTreeVisualizer new
			tree: self;
			build;
			canvas);
		yourself
]

{ #category : '*Containers-AVL-Tree-Inspector' }
CTAVLTree >> inspectorTree: aBuilder [
	<inspectorPresentationOrder: 91 title: 'Tree'>
	^ aBuilder newTree
		roots: { self root };
		children: [ :node | 
			Array streamContents: [ :s |
				node left isNilNode ifFalse: [ s nextPut: node left ].
				node right isNilNode ifFalse: [ s nextPut: node right ] ] ];
		display: [ :node | node contents asString ];
		yourself
]
