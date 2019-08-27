Class {
	#name : #ITError,
	#superclass : #Object,
	#instVars : [
		'isLoging',
		'catchedError'
	],
	#classVars : [
		'Default'
	],
	#category : #Interactions
}

{ #category : #accessing }
ITError >> catchedError: anObject [
	catchedError := anObject
]

{ #category : #accessing }
ITError >> isLoging: anObject [
	isLoging := anObject
]

{ #category : #running }
ITError >> run [
	UIManager default handleError: catchedError log: isLoging
]
