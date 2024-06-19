"
I am the entity in charge of receiving User interactions and convert them to Spec widgets.
I use double dispatch on User interactions entity.
"
Class {
	#name : 'SpecInteraction',
	#superclass : 'Object',
	#classInstVars : [
		'default'
	],
	#category : 'Interactions-Widgets',
	#package : 'Interactions-Widgets'
}

{ #category : 'accessing' }
SpecInteraction class >> default [

	^ default ifNil:[ default := self new ]
]

{ #category : 'querying' }
SpecInteraction >> widgetFor: aUserInteraction [

	^ aUserInteraction widgetFor: self
]

{ #category : 'accessing' }
SpecInteraction >> widgetForConfirmation: aConfirmation [

	^ SpConfirmDialog for: aConfirmation
]

{ #category : 'accessing' }
SpecInteraction >> widgetForFileRequest: aFileRequest [

	| widget widgetClass |
	widgetClass := aFileRequest isForFileOpening
		               ifTrue: [ StOpenFilePresenter ]
		               ifFalse: [ StOpenDirectoryPresenter ].
	widget := widgetClass for: aFileRequest.
	
	aFileRequest currentFolder ifNotNil: [ :folder | widget openFolder: folder ].
	aFileRequest filter ifNotNil: [ :filter |
		widget fileNavigationSystem filter:
			(StCustomExtensionsFilter extensions: { filter }) ].

	^ widget
]

{ #category : 'accessing' }
SpecInteraction >> widgetForInformation: anITInformation [ 

	^ SpInformDialog for: anITInformation
]
