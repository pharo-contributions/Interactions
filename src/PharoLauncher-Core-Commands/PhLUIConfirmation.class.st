"
Abstraction of a yes/no dialog.
"
Class {
	#name : #PhLUIConfirmation,
	#superclass : #Object,
	#instVars : [
		'message'
	],
	#category : #'PharoLauncher-Core-Commands'
}

{ #category : #action }
PhLUIConfirmation >> confirm [
	^ UIManager default confirm: message
]

{ #category : #accessing }
PhLUIConfirmation >> message: aString [ 
	message := aString
]

{ #category : #action }
PhLUIConfirmation >> question [
	^ UIManager default question: message
]
