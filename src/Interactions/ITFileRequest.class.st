Class {
	#name : #ITFileRequest,
	#superclass : #Object,
	#instVars : [
		'title',
		'extensionsToShow',
		'path'
	],
	#category : #Interactions
}

{ #category : #action }
ITFileRequest >> chooseFullFileName [
	^ UIManager default
		chooseFullFileName: title
		extensions: extensionsToShow
		path: path
		preview: false.
]

{ #category : #accessing }
ITFileRequest >> extensionsToShow: anObject [
	extensionsToShow := anObject
]

{ #category : #accessing }
ITFileRequest >> path: anObject [
	path := anObject
]

{ #category : #accessing }
ITFileRequest >> title: anObject [
	title := anObject
]
