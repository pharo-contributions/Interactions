Class {
	#name : 'ITRequest',
	#superclass : 'ITUserInteraction',
	#instVars : [
		'initialAnswer',
		'validationBlock',
		'answerHeight',
		'entryCompletion'
	],
	#category : 'Interactions',
	#package : 'Interactions'
}

{ #category : 'accessing' }
ITRequest >> answerHeight: anInteger [
	answerHeight := anInteger.
]

{ #category : 'accessing' }
ITRequest >> entryCompletion: anEntryCompletion [
	entryCompletion := anEntryCompletion
]

{ #category : 'accessing' }
ITRequest >> initialAnswer: aString [
	initialAnswer := aString
]

{ #category : 'private' }
ITRequest >> isValid: answer [
	^ validationBlock isNil 
		or: [ (validationBlock value: answer) not ]
]

{ #category : 'action' }
ITRequest >> multiLineRequest [
	^ UIManager default multiLineRequest: message 
		initialAnswer: initialAnswer
		answerHeight: answerHeight
]

{ #category : 'action' }
ITRequest >> request [
	| answer |
	[ answer := UIManager default
		request: message
		initialAnswer: initialAnswer ]
		doWhileTrue: [ answer isNotNil and: [ self isValid: answer ] ].
	"answer is nil when the user press cancels. That's a possible answer we have to accept."
	^ answer
]

{ #category : 'action' }
ITRequest >> requestPassword [
	UIManager default requestPassword: message
]

{ #category : 'action' }
ITRequest >> requestWithEntryCompletion [
	^ UIManager default
		request: message
		initialAnswer: initialAnswer
		entryCompletion: entryCompletion
]

{ #category : 'accessing' }
ITRequest >> validationBlock: aBlock [
	validationBlock := aBlock
]
