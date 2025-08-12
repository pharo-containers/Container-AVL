"
I am an abstract base class for AVL Tree nodes.
I define the common interface that both regular nodes (CTAVLNode) and nil nodes (CTAVLNilNode) must implement.
I include protocol for AVL-specific operations like height, balance factor, and rebalancing, as well as standard tree enumeration and searching.
Subclasses:
- CTAVLNilNode
- CTAVLNode
"
Class {
	#name : 'CTAVLAbstractNode',
	#superclass : 'Object',
	#instVars : [
		'parent'
	],
	#category : 'Containers-AVL-Tree',
	#package : 'Containers-AVL-Tree'
}

{ #category : 'adding' }
CTAVLAbstractNode >> addChild: anObject [

	^ self subclassResponsibility
]

{ #category : 'accessing' }
CTAVLAbstractNode >> balanceFactor [

	^ self subclassResponsibility 
]

{ #category : 'accessing' }
CTAVLAbstractNode >> children [

	^ {  }
]

{ #category : 'accessing' }
CTAVLAbstractNode >> contents [

	^ self subclassResponsibility 
]

{ #category : 'accessing' }
CTAVLAbstractNode >> contents: anObject [

	^ self subclassResponsibility 
]

{ #category : 'enumerating' }
CTAVLAbstractNode >> elementsFrom: min to: max into: aCollection [

		^ self subclassResponsibility

]

{ #category : 'enumerating' }
CTAVLAbstractNode >> elementsGreaterThan: anObject into: aCollection [

	^ self subclassResponsibility
]

{ #category : 'enumerating' }
CTAVLAbstractNode >> elementsLessThan: anObject into: aCollection [

	^ self subclassResponsibility
]

{ #category : 'searching' }
CTAVLAbstractNode >> findMax [

	^ self subclassResponsibility 
]

{ #category : 'searching' }
CTAVLAbstractNode >> findMaxNode [

	^ self subclassResponsibility 
]

{ #category : 'searching' }
CTAVLAbstractNode >> findMin [

	^ self subclassResponsibility 
]

{ #category : 'searching' }
CTAVLAbstractNode >> findMinNode [

	^ self subclassResponsibility 
]

{ #category : 'accessing' }
CTAVLAbstractNode >> height [

	^ self subclassResponsibility 
]

{ #category : 'enumerating' }
CTAVLAbstractNode >> inOrderDo: aBlock [

	^ self subclassResponsibility
]

{ #category : 'testing' }
CTAVLAbstractNode >> isBalanced [

	^ false
]

{ #category : 'testing' }
CTAVLAbstractNode >> isEmpty [

	^ self subclassResponsibility
]

{ #category : 'testing' }
CTAVLAbstractNode >> isLeaf [ 

	^ self subclassResponsibility 
]

{ #category : 'testing' }
CTAVLAbstractNode >> isNilNode [

	^ false
]

{ #category : 'accessing' }
CTAVLAbstractNode >> parent [

	^ parent 
]

{ #category : 'accessing' }
CTAVLAbstractNode >> parent: aNode [

	parent := aNode
]

{ #category : 'enumerating' }
CTAVLAbstractNode >> postOrderDo: aBlock [

	^ self subclassResponsibility 
]

{ #category : 'enumerating' }
CTAVLAbstractNode >> preOrderDo: aBlock [

	^ self subclassResponsibility 
]

{ #category : 'searching' }
CTAVLAbstractNode >> predecessorOf: anObject [

	^ self subclassResponsibility 
]

{ #category : 'removing' }
CTAVLAbstractNode >> removeValue: anObject [

	^ self subclassResponsibility 
]

{ #category : 'accessing' }
CTAVLAbstractNode >> search: anObject [

	^ self subclassResponsibility
]

{ #category : 'accessing' }
CTAVLAbstractNode >> size [

	^ self subclassResponsibility 
]

{ #category : 'searching' }
CTAVLAbstractNode >> successorOf: anObject [

	^ self subclassResponsibility 
]

{ #category : 'validation' }
CTAVLAbstractNode >> validateAsRoot [

	^ self subclassResponsibility 
]

{ #category : 'validation' }
CTAVLAbstractNode >> validateWithMin: min max: max [

	^ self subclassResponsibility 
]
