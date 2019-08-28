Class {
	#name : #ITInformation,
	#superclass : #ITUserInteraction,
	#instVars : [
		'aBlock'
	],
	#category : #Interactions
}

{ #category : #accessing }
ITInformation >> aBlock: block [
	aBlock := block
]

{ #category : #accessing }
ITInformation >> abort [
	UIManager default abort: message
]

{ #category : #accessing }
ITInformation >> alert [
	UIManager default alert: message

]

{ #category : #accessing }
ITInformation >> deny [
	UIManager default deny: message
]

{ #category : #action }
ITInformation >> informUserDuring [

	^ UIManager default informUser: message during: aBlock
]
