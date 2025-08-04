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
            spec package: 'Containers-AVL-Tree'.
            spec
                package: 'Containers-AVL-Tree-Tests'
                with: [ spec requires: #( 'Containers-AVL-Tree' ) ] ]
]