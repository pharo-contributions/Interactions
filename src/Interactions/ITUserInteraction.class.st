"
I'm an abstraction of a user interactionr.
I factorize some common information of my hierarchy.

My subclasses are used by the UIManager to show (or not, dependending on the interaction mode) a UI corrresponding to this model.
"
Class {
	#name : 'ITUserInteraction',
	#superclass : 'Object',
	#instVars : [
		'message',
		'title'
	],
	#category : 'Interactions',
	#package : 'Interactions'
}

{ #category : 'accessing' }
ITUserInteraction >> message [
	^ message
]

{ #category : 'accessing' }
ITUserInteraction >> message: anObject [
	message := anObject
]

{ #category : 'accessing' }
ITUserInteraction >> title [
	^ title
]

{ #category : 'accessing' }
ITUserInteraction >> title: anObject [
	title := anObject
]
