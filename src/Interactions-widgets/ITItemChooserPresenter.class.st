Class {
	#name : #ITItemChooserPresenter,
	#superclass : #SpPresenter,
	#instVars : [
		'listPresenter',
		'selectedItem'
	],
	#category : #'Interactions-widgets'
}

{ #category : #specs }
ITItemChooserPresenter class >> defaultSpec [
	^ SpBoxLayout newVertical
		add: #listPresenter;
		yourself
]

{ #category : #'instance creation' }
ITItemChooserPresenter class >> example [
	| presenter |
	presenter := ITItemChooserPresenter openOn: (1 to: 10).
	presenter isCancelled 
		ifTrue: [ ^ self inform: 'Item chooser has been cancelled!' ].
	self inform: 'You clicked accept button'.
	presenter selectedItem inspect
]

{ #category : #'instance creation' }
ITItemChooserPresenter class >> openOn: aCollection [
	^ self
		openOn: aCollection
		withDisplayBlock: [ :item | item asString ]
]

{ #category : #'instance creation' }
ITItemChooserPresenter class >> openOn: aCollection withDisplayBlock: aDisplayBlock [
	| presenter |
	presenter := ITItemChooserPresenter new.
	presenter 
		model: aCollection;
		displayBlock: aDisplayBlock;
		openModalWithSpec.
	^ presenter
]

{ #category : #api }
ITItemChooserPresenter >> displayBlock: aDisplayBlock [
	listPresenter display: aDisplayBlock
]

{ #category : #initialization }
ITItemChooserPresenter >> initializeDialogWindow: aWindowPresenter [
	super initializeDialogWindow: aWindowPresenter.
	aWindowPresenter
		okAction: [ 
			aWindowPresenter beOk.
			selectedItem := listPresenter selection selectedItem.
			aWindowPresenter close ]
]

{ #category : #initialization }
ITItemChooserPresenter >> initializeWidgets [ 
	listPresenter := self newList.
	
]

{ #category : #api }
ITItemChooserPresenter >> isCancelled [
	^ self window isCancelled
]

{ #category : #api }
ITItemChooserPresenter >> model: aCollection [
	listPresenter items: aCollection
]

{ #category : #utils }
ITItemChooserPresenter >> selectedItem [
	^ selectedItem
]
