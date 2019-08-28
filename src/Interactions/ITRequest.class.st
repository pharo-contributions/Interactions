Class {
	#name : #ITRequest,
	#superclass : #ITUserInteraction,
	#instVars : [
		'initialAnswer',
		'validationBlock',
		'answerHeight',
		'entryCompletion'
	],
	#category : #Interactions
}

{ #category : #accessing }
ITRequest >> answerHeight: anInteger [
	answerHeight := anInteger.
]

{ #category : #accessing }
ITRequest >> entryCompletion: anObject [
	entryCompletion := anObject
]

{ #category : #accessing }
ITRequest >> initialAnswer: anObject [
	initialAnswer := anObject
]

{ #category : #private }
ITRequest >> isValid: answer [
	^ validationBlock isNil 
		or: [ (validationBlock value: answer) not ]
]

{ #category : #action }
ITRequest >> multiLineRequest [
	^ UIManager default multiLineRequest: message 
		initialAnswer: initialAnswer
		answerHeight: answerHeight
]

{ #category : #action }
ITRequest >> request [
	| answer |
	[ answer := UIManager default
		request: message
		initialAnswer: initialAnswer ]
		doWhileTrue: [ answer isNotNil and: [ self isValid: answer ] ].
	"answer is nil when the user press cancels. That's a possible answer we have to accept."
	^ answer
]

{ #category : #action }
ITRequest >> requestPassword [
	UIManager default requestPassword: message
]

{ #category : #action }
ITRequest >> requestWithEntryCompletion [
	self flag: #UIManagerSameA.
	^ UIManager default
		request: message
		initialAnswer: initialAnswer
		entryCompletion: entryCompletion
]

{ #category : #accessing }
ITRequest >> validationBlock: anObject [
	validationBlock := anObject
]
