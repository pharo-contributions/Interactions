"
Abstraction of a string request dialog.
"
Class {
	#name : #PhLUIRequest,
	#superclass : #Object,
	#instVars : [
		'initialAnswer',
		'validationBlock',
		'entryCompletion',
		'message'
	],
	#category : #'PharoLauncher-Core-Commands'
}

{ #category : #action }
PhLUIRequest >> chooseFrom: aListOfChoices [
	^ UIManager default 
		chooseFrom: aListOfChoices
		lines: #()
		title: message
]

{ #category : #accessing }
PhLUIRequest >> entryCompletion: anEntryCompletion [
	entryCompletion := anEntryCompletion
]

{ #category : #accessing }
PhLUIRequest >> initialAnswer: aString [ 
	initialAnswer := aString
]

{ #category : #action }
PhLUIRequest >> questionWithoutCancel [
	^ UIManager default questionWithoutCancel: message
]

{ #category : #action }
PhLUIRequest >> request [
	| answer |
	[ answer := UIManager default request: message initialAnswer: initialAnswer ]
		doWhileTrue: [ answer isNotNil and: [ (validationBlock value: answer) not ] ].
		"answer is nil when the user press cancels. That's a possible answer we have to accept."
	^ answer
]

{ #category : #action }
PhLUIRequest >> requestPassword [
	^ UIManager default requestPassword: message
]

{ #category : #action }
PhLUIRequest >> requestWithEntryCompletion [
	^ UIManager default 
		request: message initialAnswer: initialAnswer entryCompletion: entryCompletion
]

{ #category : #accessing }
PhLUIRequest >> title: aString [ 
	message := aString
]

{ #category : #accessing }
PhLUIRequest >> validateAnswer: aBlock [
	validationBlock := aBlock
]
