"
I notify user by sending bubble notification
"
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
ITNotification >> message: aString [
	message := aString
]
