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
ITError >> logError [
	Smalltalk
		logError: catchedError messageText
		inContext: catchedError signalerContext
]

{ #category : #running }
ITError >> run [
	UIManager default handleError: catchedError log: isLoging
]

{ #category : #'as yet unclassified' }
ITError >> syntaxErrorNotificationDefaultAction [
	^ UIManager default
		syntaxErrorNotificationDefaultAction: catchedError
]

{ #category : #running }
ITError >> unhandledErrorDefaultAction [
	^ UIManager default unhandledErrorDefaultAction: catchedError 
]
