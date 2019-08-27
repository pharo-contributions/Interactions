Class {
	#name : #ITWarning,
	#superclass : #Object,
	#instVars : [
		'warning'
	],
	#classVars : [
		'Default'
	],
	#category : #Interactions
}

{ #category : #running }
ITWarning >> run [
	^ UIManager default warningDefaultAction: warning
]

{ #category : #accessing }
ITWarning >> warning: anObject [
	warning := anObject
]
