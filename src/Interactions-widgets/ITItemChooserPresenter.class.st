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
	| selectedValue |
	selectedValue := ITItemChooserPresenter openOn: (1 to: 10).
	selectedValue
		ifNil: [ selectedValue inspect.
			^ self inform: 'this case is when you click on cancel' ].
	self inform: 'you have click accept button'.
	selectedValue inspect
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
	^ presenter selectedItem
]

{ #category : #api }
ITItemChooserPresenter >> displayBlock: aDisplayBlock [
	listPresenter display: aDisplayBlock
]

{ #category : #initialization }
ITItemChooserPresenter >> initializeDialogWindow: aWindowPresenter [
	super initializeDialogWindow: aWindowPresenter.
	aWindowPresenter
		okAction: [ selectedItem := listPresenter selection selectedItem ]
]

{ #category : #initialization }
ITItemChooserPresenter >> initializeWidgets [ 
	listPresenter := self newList.
	
]

{ #category : #api }
ITItemChooserPresenter >> model: aCollection [
	listPresenter items: aCollection
]

{ #category : #utils }
ITItemChooserPresenter >> selectedItem [
	^ selectedItem
]
