Class {
	#name : #ITPrimitiveError,
	#superclass : #Object,
	#instVars : [
		'message'
	],
	#classVars : [
		'Default'
	],
	#category : #Interactions
}

{ #category : #accessing }
ITPrimitiveError >> message: aString [
	message := aString
]

{ #category : #running }
ITPrimitiveError >> run [
	^ UIManager default onPrimitiveError: message
]
