"
An ITCollectionChooserTest is a test class for testing the behavior of ITCollectionChooser
"
Class {
	#name : #ITCollectionChooserTest,
	#superclass : #TestCase,
	#instVars : [
		'presenter'
	],
	#category : #'Interactions-widgets-Tests'
}

{ #category : #running }
ITCollectionChooserTest >> setUp [
	presenter := ITCollectionChooser new
]
