Class {
	#name : 'ITConfirmationPresenterTest',
	#superclass : 'TestCase',
	#instVars : [
		'presenter',
		'window'
	],
	#category : 'Interactions-Widgets-Tests',
	#package : 'Interactions-Widgets-Tests'
}

{ #category : 'running' }
ITConfirmationPresenterTest >> setUp [
	presenter := ITConfirmationPresenter on: ITConfirmation example
]

{ #category : 'running' }
ITConfirmationPresenterTest >> tearDown [ 
	window close
]

{ #category : 'tests' }
ITConfirmationPresenterTest >> testDialogHasThreeButtons [
	"yes no cancel"
	window := presenter openDialogWithSpec.
	
	self
		assert: window buttons size
		equals: 3.
]

{ #category : 'tests' }
ITConfirmationPresenterTest >> testGetFalseWhenClickingOnFalseButton [
	| answer |
	window := presenter openDialogWithSpec.
	answer := window triggerCancelAction.
	
	self 
		assert: answer
		equals: false
]

{ #category : 'tests' }
ITConfirmationPresenterTest >> testGetInteractionCancelledExceptionWhenClickingOnCancelButton [
	window := presenter openDialogWithSpec.
	self 
		should: [ window triggerCancelAction ]
		raise: SpInteractionCancelled.
]

{ #category : 'tests' }
ITConfirmationPresenterTest >> testGetTrueWhenClickingOnTrueButton [
	| answer |
	window := presenter openDialogWithSpec.
	answer := window triggerOkAction.
	
	self 
		assert: answer
		equals: true
]
