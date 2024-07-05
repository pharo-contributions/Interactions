"
I'm an abstraction of a user interaction.

I may hold a reference to the application that triggered the interaction.
I may hold a reference to a parent window when intended to be used on a GUI backend. 
"
Class {
	#name : 'ITUserInteraction',
	#superclass : 'Object',
	#instVars : [
		'title',
		'application',
		'parentWindow'
	],
	#category : 'Interactions',
	#package : 'Interactions'
}

{ #category : 'accessing' }
ITUserInteraction >> application [

	^ application
]

{ #category : 'accessing' }
ITUserInteraction >> application: anObject [

	application := anObject
]

{ #category : 'private' }
ITUserInteraction >> backend [

	^ SpecInteraction default
]

{ #category : 'accessing' }
ITUserInteraction >> parentWindow [

	^ parentWindow
]

{ #category : 'accessing' }
ITUserInteraction >> parentWindow: anObject [

	parentWindow := anObject
]

{ #category : 'accessing' }
ITUserInteraction >> title [
	^ title
]

{ #category : 'accessing' }
ITUserInteraction >> title: anObject [
	title := anObject
]
