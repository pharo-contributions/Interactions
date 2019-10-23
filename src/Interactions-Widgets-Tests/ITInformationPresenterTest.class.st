Class {
	#name : #ITInformationPresenterTest,
	#superclass : #TestCase,
	#instVars : [
		'presenter',
		'window',
		'information'
	],
	#category : #'Interactions-Widgets-Tests'
}

{ #category : #running }
ITInformationPresenterTest >> setUp [
	information := ITInformation example.
	presenter := ITInformationPresenter on: information.
]

{ #category : #running }
ITInformationPresenterTest >> tearDown [ 
	window close
]

{ #category : #tests }
ITInformationPresenterTest >> testDialogHasOnlyOkButton [
	window := presenter openDialogWithSpec.
	
	self
		assert: window buttons size
		equals: 1.
	self
		assert: window buttons first label
		equals: 'Ok'.
]

{ #category : #tests }
ITInformationPresenterTest >> testInformationMessageIsSet [
	window := presenter openDialogWithSpec.
	
	self
		assert: presenter messageText text
		equals: information message
]

{ #category : #tests }
ITInformationPresenterTest >> testInformationTitleIsSet [
	window := presenter openDialogWithSpec.
	
	self
		assert: window title
		equals: information title
]
