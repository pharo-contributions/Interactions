"
An ITCollectionChooserTest is a test class for testing the behavior of ITCollectionChooser
"
Class {
	#name : 'ITItemChooserPresenterTest',
	#superclass : 'TestCase',
	#instVars : [
		'presenter',
		'window'
	],
	#category : 'Interactions-Widgets-Tests',
	#package : 'Interactions-Widgets-Tests'
}

{ #category : 'running' }
ITItemChooserPresenterTest >> setUp [
	presenter := ITItemsChooserPresenter new
]

{ #category : 'tests' }
ITItemChooserPresenterTest >> testItemSelectedWhenSelectItemAndTriggerOkButton [
	presenter model: #(1 2 3 4 5 6).
	presenter tablePresenter selectIndex: 2.
	
	window := presenter openDialogWithSpec.
	window triggerOkAction.
	
	self assert: presenter selectedItem equals: 2.
]

{ #category : 'tests' }
ITItemChooserPresenterTest >> testPresenterIsCancelledWhenOkActionTriggerred [
	presenter openDialogWithSpec triggerCancelAction.
	self assert: presenter isCancelled
]

{ #category : 'tests' }
ITItemChooserPresenterTest >> testPresenterIsNotCancelledWhenOkActionTriggerred [
	presenter openDialogWithSpec triggerOkAction.
	self deny: presenter isCancelled
]

{ #category : 'tests' }
ITItemChooserPresenterTest >> testSelectionIsNilWhenSelectItemAndTriggerCancelButton [
	presenter model: #(1 2 3 4 5 6).
	presenter tablePresenter selectIndex: 2.
	
	window := presenter openDialogWithSpec.
	window triggerCancelAction.
	
	self assert: presenter isCancelled.
	self assert: presenter selectedItem equals: nil.
]
