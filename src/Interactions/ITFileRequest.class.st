Class {
	#name : #ITFileRequest,
	#superclass : #Object,
	#instVars : [
		'previewer',
		'columns',
		'bookmarks',
		'okAction',
		'defaultFolder',
		'filtersCustomization'
	],
	#category : #Interactions
}

{ #category : #accessing }
ITFileRequest >> bookmarks: anObject [
	bookmarks := anObject
]

{ #category : #action }
ITFileRequest >> chooseDirectory [
	"
	model := ITFileRequest new. 
	model defaultFolder: '/home' asFileReference.
	model chooseDirectory"

	| fileDialog |
	fileDialog := FDOpenDirectoryDialog new.
	self communActionFor: fileDialog.
	^ fileDialog confirm
]

{ #category : #action }
ITFileRequest >> chooseFile [
	| fileDialog |
	fileDialog := FDOpenFileDialog new.
	self communActionFor: fileDialog.
	^ fileDialog confirm
]

{ #category : #accessing }
ITFileRequest >> columns: anObject [
	columns := anObject
]

{ #category : #action }
ITFileRequest >> communActionFor: fileDialog [
	self configureFileDialog: fileDialog.
	fileDialog openModalWithSpec
]

{ #category : #setup }
ITFileRequest >> configureFileDialog: fileDialog [
	"I do this because fileDialog have default value"

	previewer ifNotNil: [ fileDialog previewer: previewer ].
	columns ifNotNil: [ fileDialog column: columns ].
	bookmarks ifNotNil: [ fileDialog bookmarks: bookmarks ].
	okAction ifNotNil: [ fileDialog okAction: okAction ].
	defaultFolder ifNotNil: [ fileDialog defaultFolder: defaultFolder ].
	filtersCustomization
		ifNotNil: [ fileDialog filtersCustomization: filtersCustomization ]
]

{ #category : #accessing }
ITFileRequest >> defaultFolder: anObject [
	defaultFolder := anObject
]

{ #category : #accessing }
ITFileRequest >> filtersCustomization: anObject [
	filtersCustomization := anObject
]

{ #category : #accessing }
ITFileRequest >> okAction: anObject [
	okAction := anObject
]

{ #category : #accessing }
ITFileRequest >> previewer: anObject [
	previewer := anObject
]

{ #category : #action }
ITFileRequest >> saveFile [
	| fileDialog |
	fileDialog := FDSaveFileDialog new.
	self communActionFor: fileDialog.
	^ fileDialog selectedFile
]
