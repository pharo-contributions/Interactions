Class {
	#name : #ITInformation,
	#superclass : #Object,
	#instVars : [
		'message',
		'aBlock'
	],
	#category : #Interactions
}

{ #category : #accessing }
ITInformation >> aBlock: block [
	aBlock := block
]

{ #category : #action }
ITInformation >> informUserDuring [

	^ UIManager default informUser: message during: aBlock
]
