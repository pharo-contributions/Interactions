"
I'm an abstraction of a user interaction that provides a message.
"
Class {
	#name : 'ITUserInteractionWithMessage',
	#superclass : 'ITUserInteraction',
	#instVars : [
		'message'
	],
	#category : 'Interactions',
	#package : 'Interactions'
}

{ #category : 'accessing' }
ITUserInteractionWithMessage >> message [
	^ message
]

{ #category : 'accessing' }
ITUserInteractionWithMessage >> message: anObject [
	message := anObject
]
