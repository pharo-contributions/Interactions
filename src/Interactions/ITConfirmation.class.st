Class {
	#name : #ITConfirmation,
	#superclass : #Object,
	#instVars : [
		'message',
		'title'
	],
	#category : #Interactions
}

{ #category : #action }
ITConfirmation >> proceed [
	^ UIManager default proceed: message title: title
]

{ #category : #action }
ITConfirmation >> question [
	^ UIManager default question: message title: title
]

{ #category : #action }
ITConfirmation >> questionWithoutCancel [
	^ UIManager default questionWithoutCancel: message title: title
]

{ #category : #accessing }
ITConfirmation >> title: aTitle [
	title := aTitle
]
