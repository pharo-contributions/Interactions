"
I'm used to interact with user by asking to choose a File/Directory or save a directory 

"
Class {
	#name : 'ITFileRequest',
	#superclass : 'ITUserInteraction',
	#instVars : [
		'filter',
		'currentFolder',
		'isForFileOpening'
	],
	#category : 'Interactions',
	#package : 'Interactions'
}

{ #category : 'private' }
ITFileRequest >> beForFolderOpening [

	isForFileOpening := false
]

{ #category : 'running' }
ITFileRequest >> chooseDirectory [
	self beForFolderOpening.
	^ self chooseFile
]

{ #category : 'running' }
ITFileRequest >> chooseFile [

	^ (self backend widgetFor: self)
			doInteraction
]

{ #category : 'accessing' }
ITFileRequest >> currentFolder [

	^ currentFolder
]

{ #category : 'accessing' }
ITFileRequest >> currentFolder: aFileReference [

	aFileReference exists ifFalse: [ ^ self ].
	
	currentFolder := aFileReference
]

{ #category : 'accessing' }
ITFileRequest >> filter [
	
	^ filter
]

{ #category : 'accessing' }
ITFileRequest >> filter: aFilterName [

	"will configure the file chooser to only allow files with the selected filter"
	filter := aFilterName
]

{ #category : 'initialization' }
ITFileRequest >> initialize [ 

	super initialize.
	isForFileOpening := true.
]

{ #category : 'testing' }
ITFileRequest >> isForFileOpening [
	
	^ isForFileOpening
]

{ #category : 'private' }
ITFileRequest >> widgetFor: aBackend [ 

	^ aBackend widgetForFileRequest: self
]
