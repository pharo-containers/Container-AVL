"
A visualization for the inspector for AVLTree, it creates an inspector tab to visualize the nodes of the tree
"
Class {
	#name : 'CTAVLTreeVisualizer',
	#superclass : 'RSAbstractContainerBuilder',
	#instVars : [
		'tree'
	],
	#category : 'Containers-AVL-Tree-Inspector',
	#package : 'Containers-AVL-Tree-Inspector'
}

{ #category : 'events' }
CTAVLTreeVisualizer >> addFindingPath: number [
	| node path link |
	node := (CTAVLTree >> #checkPath:) ast.
	path := OrderedCollection new.
	link := MetaLink new
		arguments: #(context);
		selector: #value:;
		metaObject: [ :context | path addAll: (context tempNamed: #aCollection) ];
		yourself.
	node link: link.
	[tree add: number] ensure: [ link uninstall ].
	^ path
	
]

{ #category : 'events' }
CTAVLTreeVisualizer >> addNewNumber [
	| number |
	number := self readNumber.
	number ifNil: [ ^ self ].
	self addWithAnimation: number
]

{ #category : 'hooks' }
CTAVLTreeVisualizer >> addPlusButtom [
	| label |
	label := RSLabel new 
		text: '+1';
		when: RSMouseClick send: #addNewNumber to: self;
		@ RSHighlightable blue;
		isFixed: true;
		position: 20@20;
		yourself.
	container add: label.
]

{ #category : 'events' }
CTAVLTreeVisualizer >> addWithAnimation: number [
	| path newNode root lastPosition |
	path := self addFindingPath: number.
	path inspect.
	newNode := self createNode: path last value.
	root := container shapeFromModel: tree root.
	lastPosition := root position + (0 @ -40).
	newNode position: lastPosition.
	
	container add: newNode. 
	container animationFrom: (path collect: [ :asso | | node anime |
		node := container shapeFromModel: asso value.
		
		anime := container transitionAnimation
			duration: 1 second;
			from: lastPosition;
			to: node position;
			onStepDo: [ :t | newNode position: t; signalUpdate ];
			yourself.
		lastPosition := node position.
		anime 
	 ]).
	
]

{ #category : 'private' }
CTAVLTreeVisualizer >> createNode: node [ 
	| label w h back |
	label := RSLabel new 
		text: node contents asString;
		color: 'black';
		yourself.
	w := label width.
	h := label height.
	back :=RSEllipse new
		size: (w max: h)+5;
		border: (RSBorder new color: 'black');
		color: (node isBalanced
			ifTrue: ['green']
			ifFalse: ['red']);
		yourself.
		
	^ { back. label } asShape
		model: node;
		padding: 7;
		draggable;
		yourself.
]

{ #category : 'accessing - defaults' }
CTAVLTreeVisualizer >> defaultContainer [
	^ RSCanvas new @ RSCanvasController simple
]

{ #category : 'events' }
CTAVLTreeVisualizer >> readNumber [
	| answer |
	answer := UIManager default request: 'Enter a number:' initialAnswer: '4'.
	answer ifNil: [ ^ nil ].
	[ 
		^ answer asNumber.
		
	] onErrorDo: [ :ex | self inform: 'no number'. ^ nil ].
]

{ #category : 'hooks' }
CTAVLTreeVisualizer >> renderIn: aCanvas [
	| children |
	children := tree allChildren collect: [ :child | self createNode: child ] as: Array.
	aCanvas addAll: children.
	RSLineBuilder line
		withBorderAttachPoint;
		markerEnd: (RSShapeFactory arrow size: 10);
		shapes: children;
		connectToAll: [ :child | child children ].
	RSTreeLayout on: children.
	"self addPlusButtom"
]

{ #category : 'accessing' }
CTAVLTreeVisualizer >> tree [
	^ tree
]

{ #category : 'accessing' }
CTAVLTreeVisualizer >> tree: anAVLTree [
	tree := anAVLTree
]
