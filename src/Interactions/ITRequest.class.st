Class {
	#name : #ITRequest,
	#superclass : #Object,
	#instVars : [
		'message',
		'title',
		'initialAnswer',
		'validationBlock',
		'answerHeight'
	],
	#category : #Interactions
}

{ #category : #accessing }
ITRequest >> answerHeight: anInteger [
	answerHeight := anInteger.
]

{ #category : #action }
ITRequest >> multiLineRequest [
	^ UIManager default multiLineRequest: message 
		initialAnswer: initialAnswer
		answerHeight: answerHeight
]
