Class {
	#name : #PhLUIConfirmation,
	#superclass : #Object,
	#instVars : [
		'message',
		'title'
	],
	#category : #'PharoLauncher-Core-Commands'
}

{ #category : #action }
PhLUIConfirmation >> proceed [
	^ UIManager default proceed: message title: title
]

{ #category : #action }
PhLUIConfirmation >> question [
	^ UIManager default question: message title: title
]

{ #category : #action }
PhLUIConfirmation >> questionWithoutCancel [
	^ UIManager default questionWithoutCancel: message title: title
]

{ #category : #accessing }
PhLUIConfirmation >> title: aTitle [
	title := aTitle
]
