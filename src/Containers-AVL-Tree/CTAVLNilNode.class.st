"
I represent an empty node in an AVL Tree using the Null Object pattern.
I provide default 'do nothing' behavior for all tree operations, eliminating the need for nil checks throughout the tree algorithms. This makes the code cleaner and prevents null pointer errors.
When elements are added to me, I create and return a new CTAVLNode containing the element, effectively growing the tree. I maintain height 0 and am always balanced
"
Class {
	#name : 'CTAVLNilNode',
	#superclass : 'CTAVLAbstractNode',
	#category : 'Containers-AVL-Tree',
	#package : 'Containers-AVL-Tree'
}

{ #category : 'adding' }
CTAVLNilNode >> addChild: anObject [

	^ CTAVLNode new
		contents: anObject;
		parent: self parent;
		yourself
]

{ #category : 'accessing' }
CTAVLNilNode >> balanceFactor [

	^ 0
]

{ #category : 'accessing' }
CTAVLNilNode >> contents [

	^ nil
]

{ #category : 'accessing' }
CTAVLNilNode >> contents: anObject [

	"Do nothing for nil node"
]

{ #category : 'enumerating' }
CTAVLNilNode >> elementsFrom: min to: max into: aCollection [

	"Do Nothing for Nil Node"
]

{ #category : 'enumerating' }
CTAVLNilNode >> elementsGreaterThan: anObject into: aCollection [

	"Do Nothing for Nil Node"
]

{ #category : 'enumerating' }
CTAVLNilNode >> elementsLessThan: anObject into: aCollection [

	"Do Nothing for Nil Node"
]

{ #category : 'searching' }
CTAVLNilNode >> findMax [ 

	^ nil
]

{ #category : 'searching' }
CTAVLNilNode >> findMaxNode [

	^ self
]

{ #category : 'searching' }
CTAVLNilNode >> findMin [

	^ nil
]

{ #category : 'searching' }
CTAVLNilNode >> findMinNode [

	^ self
]

{ #category : 'accessing' }
CTAVLNilNode >> height [ 
	
	^ 0
]

{ #category : 'enumerating' }
CTAVLNilNode >> inOrderDo: aBlock [

	"Do Nothing for Nil Node"
]

{ #category : 'testing' }
CTAVLNilNode >> isEmpty [

	^ true
]

{ #category : 'testing' }
CTAVLNilNode >> isLeaf [ 
	^ false
]

{ #category : 'testing' }
CTAVLNilNode >> isNilNode [

	^ true
]

{ #category : 'enumerating' }
CTAVLNilNode >> postOrderDo: aBlock [

	"Do Nothing for Nil Node"
]

{ #category : 'enumerating' }
CTAVLNilNode >> preOrderDo: aBlock [

	"Do Nothing for Nil Node"
]

{ #category : 'searching' }
CTAVLNilNode >> predecessorOf: anObject [

	^ nil
]

{ #category : 'removing' }
CTAVLNilNode >> removeValue: anObject [

	^ self 
]

{ #category : 'accessing' }
CTAVLNilNode >> search: anObject [

	^ nil
]

{ #category : 'accessing' }
CTAVLNilNode >> size [

	^ 0
]

{ #category : 'searching' }
CTAVLNilNode >> successorOf: anObject [

	^ nil
]

{ #category : 'validation' }
CTAVLNilNode >> validateAsRoot [

	^ true
]

{ #category : 'validation' }
CTAVLNilNode >> validateWithMin: min max: max [

	^ true
]
