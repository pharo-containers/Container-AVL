"
I am a baseline
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
	spec for: #common do: [ "Packages"
		spec package: 'Containers-AVL-Tree'.
		spec
			package: 'Containers-AVL-Tree-Tests'
			with: [ spec requires: #( 'Containers-AVL-Tree' ) ].
		spec
			package: 'Containers-AVL-Tree-Inspector'
			with: [ spec requires: #( 'Containers-AVL-Tree' ) ].

		"Define groups"
		spec
			group: 'Core'
			with: #( 'Containers-AVL-Tree' 'Containers-AVL-Tree-Inspector' );
			group: 'Tests' with: #( 'Containers-AVL-Tree-Tests' ).

		spec group: 'default' with: #( 'Core' 'Tests' ) ]
]
