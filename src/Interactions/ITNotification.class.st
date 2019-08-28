Class {
	#name : #ITNotification,
	#superclass : #Object,
	#instVars : [
		'message'
	],
	#category : #Interactions
}

{ #category : #'accessing - bounds' }
ITNotification >> inform [
	^ UIManager default inform: message
]

{ #category : #accessing }
ITNotification >> message: anObject [
	message := anObject
]
