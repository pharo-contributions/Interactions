Class {
	#name : #ITUserInteraction,
	#superclass : #Object,
	#instVars : [
		'message',
		'title'
	],
	#category : #Interactions
}

{ #category : #accessing }
ITUserInteraction >> message: anObject [
	message := anObject
]

{ #category : #accessing }
ITUserInteraction >> title: anObject [
	title := anObject
]
