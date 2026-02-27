Extension { #name : 'CTAVLNode' }

{ #category : '*Containers-AVL-Tree-Inspector' }
CTAVLNode >> allChildren [
	^ Array streamContents: [ :s |
		left isNilNode ifFalse: [ s nextPut: left ].
		right isNilNode ifFalse: [ s nextPut: right ] ]
]
