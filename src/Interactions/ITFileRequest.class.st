"
I'm using to interact with user by asking to choose a File/Directory or save a directory 

for more information about how to customize 
look at 
	FDFileDialogPresenter clas >> #fullExample
"
Class {
	#name : #ITFileRequest,
	#superclass : #Object,
	#instVars : [
		'previewer',
		'columns',
		'bookmarks',
		'okAction',
		'defaultFolder',
		'filtersCustomization',
		'extensionString'
	],
	#category : #Interactions
}

{ #category : #example }
ITFileRequest class >> example [ 
	ITFileRequest new
		"previewer:  ;"
		"columns: ;"
		"bookmarks: ;"
		okAction: [:fileReference | fileReference inspect ] ;
		"defaultFolder: ;"
		"filtersCustomization: ;"
		"extensionString: ;"
		chooseDirectory
]

{ #category : #accessing }
ITFileRequest >> bookmarks: aCollectionOfBookmark [
	bookmarks := aCollectionOfBookmark
]

{ #category : #action }
ITFileRequest >> chooseDirectory [
	"
	model := ITFileRequest new. 
	model defaultFolder: '/home' asFileReference.
	model chooseDirectory"

	| fileDialog |
	fileDialog := FDOpenDirectoryDialog new.
	self commonActionFor: fileDialog.
	^ fileDialog confirm
]

{ #category : #action }
ITFileRequest >> chooseFile [
	| fileDialog |
	fileDialog := FDOpenFileDialog new.
	self commonActionFor: fileDialog.
	^ fileDialog confirm
]

{ #category : #accessing }
ITFileRequest >> columns: aCollectionOfColumn [
	columns := aCollectionOfColumn
]

{ #category : #private }
ITFileRequest >> commonActionFor: fileDialog [
	self configureFileDialog: fileDialog.
	fileDialog openModalWithSpec
]

{ #category : #action }
ITFileRequest >> configurationForSaveFileDialog: fileDialog [
	extensionString ifNotNil: [ fileDialog extension: extensionString ].
	self commonActionFor: fileDialog
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
ITFileRequest >> defaultFolder: aFileReference [
	defaultFolder := aFileReference
]

{ #category : #accessing }
ITFileRequest >> filtersCustomization: aCollectionOfFilter [
	filtersCustomization := aCollectionOfFilter
]

{ #category : #accessing }
ITFileRequest >> okAction: aBlockUseByTheOkButton [
	"this block take one argument , a FileReference"
	okAction := aBlockUseByTheOkButton
]

{ #category : #accessing }
ITFileRequest >> previewer: aPreviewer [
	previewer := aPreviewer
]

{ #category : #action }
ITFileRequest >> saveFile [
	| fileDialog |
	fileDialog := FDSaveFileDialog new.
	self configurationForSaveFileDialog: fileDialog.
	^ fileDialog selectedFile
]
