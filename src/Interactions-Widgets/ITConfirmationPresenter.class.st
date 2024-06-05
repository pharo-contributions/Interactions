"
I ask the user a confirmation of its intent.
I open myself in a dialog box.
"
Class {
	#name : 'ITConfirmationPresenter',
	#superclass : 'ITInformationPresenter',
	#category : 'Interactions-Widgets',
	#package : 'Interactions-Widgets'
}

{ #category : 'example' }
ITConfirmationPresenter class >> example [
	(self on: ITConfirmation example) openDialogWithSpec
]

{ #category : 'private' }
ITConfirmationPresenter >> icon [
	^ (self iconNamed: #question) magnifyBy: 2 
]
