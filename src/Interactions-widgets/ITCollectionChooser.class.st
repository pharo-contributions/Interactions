Class {
	#name : #ITCollectionChooser,
	#superclass : #SpPresenter,
	#instVars : [
		'listPresenter',
		'selectedItem'
	],
	#category : #'Interactions-widgets'
}

{ #category : #specs }
ITCollectionChooser class >> defaultSpec [
	^ SpBoxLayout newVertical
		add: #listPresenter;
		yourself
]

{ #category : #'instance creation' }
ITCollectionChooser class >> example [
	| selectedValue |
	selectedValue := ITCollectionChooser openOn: (1 to: 10).
	selectedValue
		ifNil: [ selectedValue inspect.
			^ self inform: 'this case is when you click on cancel' ].
	self inform: 'you have click accept button'.
	selectedValue inspect
]

{ #category : #'instance creation' }
ITCollectionChooser class >> openOn: aCollection [
	^ self
		openOn: aCollection
		withDisplayBlock: [ :item | item asString ]
]

{ #category : #'as yet unclassified' }
ITCollectionChooser class >> openOn: aCollection withDisplayBlock: aDisplayBlock [
	| presenter |
	presenter := ITCollectionChooser new.
	presenter model: aCollection withDisplayBlock: aDisplayBlock.
	presenter openModalWithSpec presenter selectedItem ifNil: [ ^ nil ].
	^ presenter selectedItem
]

{ #category : #initialization }
ITCollectionChooser >> initializeDialogWindow: aWindowPresenter [
	super initializeDialogWindow: aWindowPresenter.
	aWindowPresenter okAction: [ selectedItem:=  listPresenter selection selectedItem ]
]

{ #category : #initialization }
ITCollectionChooser >> initializeWidgets [ 
	listPresenter := self newList.
	
]

{ #category : #api }
ITCollectionChooser >> model: aCollection [
	self
		model: aCollection
		withDisplayBlock: [ :selectedItem | selectedItem asString ]
]

{ #category : #api }
ITCollectionChooser >> model: aCollection withDisplayBlock: aDisplayBlock [
	listPresenter
		items: aCollection;
		display: aDisplayBlock
]

{ #category : #utils }
ITCollectionChooser >> selectedItem [
	^ selectedItem
]
