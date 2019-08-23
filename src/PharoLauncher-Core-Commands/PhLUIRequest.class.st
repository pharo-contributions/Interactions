Class {
	#name : #PhLUIRequest,
	#superclass : #Object,
	#instVars : [
		'message',
		'title',
		'initialAnswer',
		'validationBlock',
		'answerHeight'
	],
	#category : #'PharoLauncher-Core-Commands'
}

{ #category : #accessing }
PhLUIRequest >> answerHeight: anInteger [
	answerHeight := anInteger.
]

{ #category : #action }
PhLUIRequest >> multiLineRequest [
	^ UIManager default multiLineRequest: message 
		initialAnswer: initialAnswer
		answerHeight: answerHeight
]
