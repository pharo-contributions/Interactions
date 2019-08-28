"
I notify the user of the progress of the current action.
"
Class {
	#name : #ITProgressNotification,
	#superclass : #Object,
	#instVars : [
		'string',
		'block'
	],
	#category : #Interactions
}

{ #category : #accessing }
ITProgressNotification >> block: anObject [
	block := anObject
]

{ #category : #action }
ITProgressNotification >> informUserDuring [
	^ UIManager default informUser: string during: block
]

{ #category : #action }
ITProgressNotification >> informUserDuringBlock [
	^ UIManager default informUserDuring: block
]

{ #category : #accessing }
ITProgressNotification >> string: anObject [
	string := anObject
]
