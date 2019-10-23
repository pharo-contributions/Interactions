"
I notify user by sending notifications that display a few seconds, then disappear.
You can configure an action to execute when there is a click on the notification widget.
"
Class {
	#name : #ITNotification,
	#superclass : #Object,
	#instVars : [
		'message',
		'clickAction'
	],
	#category : #Interactions
}

{ #category : #example }
ITNotification class >> example [ 
	^ self new 
		message: 'A simple notification';
		yourself 
]

{ #category : #accessing }
ITNotification >> clickAction [
	^ clickAction
]

{ #category : #accessing }
ITNotification >> clickAction: aBlock [
	clickAction := aBlock
]

{ #category : #accessing }
ITNotification >> message [
	^ message
]

{ #category : #accessing }
ITNotification >> message: aString [
	message := aString
]
