Class {
	#name : #ITInform,
	#superclass : #Object,
	#instVars : [
		'message'
	],
	#category : #Interactions
}

{ #category : #'accessing - bounds' }
ITInform >> inform [
	^ UIManager default inform: message
]

{ #category : #accessing }
ITInform >> message: anObject [
	message := anObject
]
