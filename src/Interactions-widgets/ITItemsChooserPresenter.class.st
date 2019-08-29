"
I'm a widget use to select one or more element from a collection 

API 
	
beMultiselection
	turn to multiselection by adding checkbox 

selectedItem  
	return the selected Item

selectedItems 
	return a collection of Item 
"
Class {
	#name : #ITItemsChooserPresenter,
	#superclass : #SpPresenter,
	#instVars : [
		'selectedItem',
		'tablePresenter',
		'stringColumnDisplayBlock',
		'columns',
		'selectedItems',
		'items',
		'isMultiSelection'
	],
	#classVars : [
		'Columns'
	],
	#category : #'Interactions-widgets'
}

{ #category : #specs }
ITItemsChooserPresenter class >> defaultSpec [
	^ SpBoxLayout newVertical
		add: #tablePresenter;
		yourself
]

{ #category : #'instance creation' }
ITItemsChooserPresenter class >> example [
	| presenter |
	presenter := ITItemsChooserPresenter openOn: (1 to: 10).
	presenter isCancelled 
		ifTrue: [ ^ self inform: 'Item chooser has been cancelled!' ].
	self inform: 'You clicked accept button'.
	presenter selectedItem inspect
]

{ #category : #'instance creation' }
ITItemsChooserPresenter class >> exampleMultiSelection [
	| presenter |
	presenter := ITItemsChooserPresenter new
		model: (1 to: 10);
		beMultipleSelection;
		openModalWithSpec;
		yourself.
	presenter isCancelled
		ifTrue: [ ^ self inform: 'Item chooser has been cancelled!' ].
	self inform: 'You clicked accept button'.
	presenter selectedItems inspect
]

{ #category : #'instance creation' }
ITItemsChooserPresenter class >> exampleSingleSelection [
	| presenter |
	presenter := ITItemsChooserPresenter new
		model: (1 to: 10);
		displayBlock: [ :item | item * 2 ];
		openModalWithSpec;
		yourself.
	presenter isCancelled
		ifTrue: [ ^ self inform: 'Item chooser has been cancelled!' ].
	self inform: 'You clicked accept button'.
	presenter selectedItem inspect
]

{ #category : #'class initialization' }
ITItemsChooserPresenter class >> initialize [
	Columns := { SpStringTableColumn title: 'name' evaluated: [:item | item asString  ] }
]

{ #category : #'instance creation' }
ITItemsChooserPresenter class >> openOn: aCollection [
	^ self
		openOn: aCollection
		withDisplayBlock: [ :item | item asString ]
]

{ #category : #'instance creation' }
ITItemsChooserPresenter class >> openOn: aCollection withDisplayBlock: aDisplayBlock [
	| presenter |
	presenter := ITItemsChooserPresenter new.
	presenter 
		model: aCollection;
		displayBlock: aDisplayBlock;
		openModalWithSpec.
	^ presenter
]

{ #category : #api }
ITItemsChooserPresenter >> beMultipleSelection [
	isMultiSelection := true.
	self
		columns:
			{self checkBoxColumn.
			(SpStringTableColumn evaluated: [ :item | item asString ])}
]

{ #category : #private }
ITItemsChooserPresenter >> checkBoxColumn [
	^ (SpCheckBoxTableColumn
		evaluated: [ :item | selectedItems includes: item ])
		onActivation: [ :item | selectedItems add: item ];
		onDesactivation: [ :item | selectedItems remove: item  ];
		width: 30
]

{ #category : #api }
ITItemsChooserPresenter >> columns: aCollectionOfColumn [
	tablePresenter columns: aCollectionOfColumn
]

{ #category : #api }
ITItemsChooserPresenter >> displayBlock: aDisplayBlock [
	isMultiSelection
		ifTrue: [ self
				columns:
					{self checkBoxColumn.
					(self newStringTableColumnEvaluated: aDisplayBlock)} ]
		ifFalse:
			[ self columns: {(self newStringTableColumnEvaluated: aDisplayBlock)} ]
]

{ #category : #initialization }
ITItemsChooserPresenter >> initialize [
	super initialize.
	selectedItems := OrderedCollection new.
	isMultiSelection := false
]

{ #category : #initialization }
ITItemsChooserPresenter >> initializeDialogWindow: aWindowPresenter [
	super initializeDialogWindow: aWindowPresenter.
	aWindowPresenter
		okAction: [ 
			aWindowPresenter beOk.
			selectedItem := tablePresenter selection selectedItem.
			aWindowPresenter close ]
]

{ #category : #initialization }
ITItemsChooserPresenter >> initializeWidgets [
	columns := Columns.
	tablePresenter := self newTable.
	tablePresenter columns: columns.
	tablePresenter selectIndex: 1
]

{ #category : #api }
ITItemsChooserPresenter >> isCancelled [
	^ self window isCancelled
]

{ #category : #api }
ITItemsChooserPresenter >> model: aCollection [
	tablePresenter items: aCollection.
	items := aCollection copy
]

{ #category : #private }
ITItemsChooserPresenter >> newStringTableColumnEvaluated: aDisplayBlock [
	^ SpStringTableColumn evaluated: aDisplayBlock
]

{ #category : #api }
ITItemsChooserPresenter >> selectedItem [
	^ selectedItem
]

{ #category : #api }
ITItemsChooserPresenter >> selectedItems [
	^ selectedItems
]

{ #category : #accessing }
ITItemsChooserPresenter >> tablePresenter [
	^ tablePresenter
]
