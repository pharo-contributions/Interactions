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

{ #category : 'accessing' }
ITUserInteraction >> title [
	^ title
]

{ #category : 'accessing' }
ITUserInteraction >> title: anObject [
	title := anObject
]
