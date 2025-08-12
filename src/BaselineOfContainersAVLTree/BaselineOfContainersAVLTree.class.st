"
I represent Baseline of AVL Tree
"
Class {
	#name : 'BaselineOfContainersAVLTree',
	#superclass : 'BaselineOf',
	#category : 'BaselineOfContainersAVLTree',
	#package : 'BaselineOfContainersAVLTree'
}

{ #category : 'baselines' }
BaselineOfContainersAVLTree >> baseline: spec [
	<baseline>

	spec for: #common do: [
		"Packages"
		spec package: 'Containers-AVL-Tree'.
		spec
			package: 'Containers-AVL-Tree-Tests'
			with: [ spec requires: #( 'Containers-AVL-Tree' ) ].
		spec
			package: 'Containers-AVL-Tree-Inspector'
			with: [ spec requires: #( 'Containers-AVL-Tree' ) ].
			
		"Groups"
		spec group: 'Tests' with: #( 'Containers-AVL-Tree-Tests' )].
	
	SystemVersion current major > 11 
		ifTrue: [ spec group: 'Core' with: #( 'Containers-AVL-Tree' 'Containers-AVL-Tree-Inspector' ) ]
		ifFalse:[ spec group: 'Core' with: #( 'Containers-AVL-Tree' ) ].

	spec group: 'default' with: #( 'Core' 'Tests' )  
]
