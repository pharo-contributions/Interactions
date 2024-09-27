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
	| fileDialog |

	fileDialog := aFileRequest application newOpenFile.

	aFileRequest isForFileOpening
		ifTrue: [ fileDialog beOpenFile ]
		ifFalse: [ fileDialog beOpenDirectory ].
	
	aFileRequest currentFolder ifNotNil: [ :folder | fileDialog path: folder ].
	aFileRequest filter 
		ifNotNil: [ :filter | fileDialog addFilter: filter ].

	^ fileDialog
]

{ #category : 'accessing' }
SpecInteraction >> widgetForInformation: anITInformation [ 

	^ SpInformDialog for: anITInformation
]
