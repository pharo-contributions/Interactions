"
I notify the user of different kind of information: alert, abort, accessDenied.
I open myself in a dialog box.
"
Class {
	#name : #ITInformationPresenter,
	#superclass : #SpPresenterWithModel,
	#instVars : [
		'messageLabel',
		'iconPresenter'
	],
	#category : #'Interactions-Widgets'
}

{ #category : #specs }
ITInformationPresenter class >> defaultSpec [
	^ SpBoxLayout newHorizontal
		add: #iconPresenter width: 150;
		add: #messageLabel;
		yourself
]

{ #category : #example }
ITInformationPresenter class >> example [
	(self on: ITInformation example) openDialogWithSpec
]

{ #category : #private }
ITInformationPresenter >> icon [ 
	self model type = #abort
		ifTrue: [ ^ (self iconNamed: #stop) magnifyBy: 5 ].
	self model type = #alert
		ifTrue: [ ^ (self iconNamed: #warning) magnifyBy: 5 ].
	self model type = #deny
		ifTrue: [ ^ (self iconNamed: #lock) magnifyBy: 5 ].
	^ self iconNamed: #blank
]

{ #category : #initialization }
ITInformationPresenter >> initialExtent [
	
	^ (self currentWorld extent x / 2) @ 200
]

{ #category : #initialization }
ITInformationPresenter >> initializePresenters [ 
	iconPresenter := self newImage
		image: self icon;
		yourself.
	messageLabel := self newText 
		text: self model message;
		disable;
		yourself.
]

{ #category : #initialization }
ITInformationPresenter >> initializeWindow: aWindowPresenter [
	super initializeWindow: aWindowPresenter. 
	aWindowPresenter title: self model title
]
