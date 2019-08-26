Class {
	#name : #ITRequest,
	#superclass : #Object,
	#instVars : [
		'message',
		'title',
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

{ #category : #action }
ITRequest >> chooseFrom: aListOfChoices [
	self flag: #lookAtIt.
	^ UIManager default
		chooseFrom: aListOfChoices
		lines: #()
		title: message
]

{ #category : #accessing }
ITRequest >> entryCompletion: anObject [
	entryCompletion := anObject
]

{ #category : #accessing }
ITRequest >> initialAnswer: anObject [
	initialAnswer := anObject
]

{ #category : #accessing }
ITRequest >> message: anObject [
	message := anObject
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
		doWhileTrue: [ answer isNotNil and: [ (validationBlock value: answer) not ] ].
	"answer is nil when the user press cancels. That's a possible answer we have to accept."
	^ answer
]

{ #category : #action }
ITRequest >> requestPassword [
	UIManager default requestPassword: message
]

{ #category : #action }
ITRequest >> requestWithEntryCompletion [
	self flag: #sameA.
	^ UIManager default
		request: message
		initialAnswer: initialAnswer
		entryCompletion: entryCompletion
]

{ #category : #action }
ITRequest >> textEntryTitleEntryText [
	self flag: #sameA.
	UIManager default
		request: message
		initialAnswer: initialAnswer
		title: title
	"UIManager default
		textEntry: message
		title: title
		entryText: initialAnswer"
]

{ #category : #accessing }
ITRequest >> title: anObject [
	title := anObject
]

{ #category : #accessing }
ITRequest >> validationBlock: anObject [
	validationBlock := anObject
]
