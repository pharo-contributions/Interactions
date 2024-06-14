Class {
	#name : 'BaselineOfInteractions',
	#superclass : 'BaselineOf',
	#category : 'BaselineOfInteractions',
	#package : 'BaselineOfInteractions'
}

{ #category : 'baselines' }
BaselineOfInteractions >> baseline: spec [

	<baseline>
	spec
		package: 'Interactions';
		package: 'Interactions-Widgets'
			with: [ spec requires: #( 'Interactions' ) ];
		package: 'Interactions-Tests'
			with: [ spec requires: #( 'Interactions' 'Interactions-Widgets' ) ]
]
