"
An ITCollectionChooserTest is a test class for testing the behavior of ITCollectionChooser
"
Class {
	#name : #ITItemChooserPresenterTest,
	#superclass : #TestCase,
	#instVars : [
		'presenter'
	],
	#category : #'Interactions-widgets-Tests'
}

{ #category : #running }
ITItemChooserPresenterTest >> setUp [
	presenter := ITItemsChooserPresenter new
]
