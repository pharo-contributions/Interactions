"
I'm an abstraction of a user interaction.
"
Class {
	#name : 'ITUserInteraction',
	#superclass : 'Object',
	#instVars : [
		'title'
	],
	#category : 'Interactions',
	#package : 'Interactions'
}

{ #category : 'private' }
ITUserInteraction >> backend [

	^ SpecInteraction default
]

{ #category : 'accessing' }
ITUserInteraction >> title [
	^ title
]

{ #category : 'accessing' }
ITUserInteraction >> title: anObject [
	title := anObject
]
