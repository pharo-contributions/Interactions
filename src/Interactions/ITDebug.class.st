Class {
	#name : #ITDebug,
	#superclass : #Object,
	#instVars : [
		'process',
		'context',
		'title',
		'boolean',
		'notifiactionString'
	],
	#category : #Interactions
}

{ #category : #accessing }
ITDebug >> boolean: anObject [
	boolean := anObject
]

{ #category : #accessing }
ITDebug >> context: anObject [
	context := anObject
]

{ #category : #initialization }
ITDebug >> initialize [
	super initialize.
	boolean := false.
	title := ''
]

{ #category : #accessing }
ITDebug >> notifiactionString:  anObject [
	notifiactionString := anObject
]

{ #category : #action }
ITDebug >> open [
	^ UIManager default
		debugProcess: process
		context: context
		label: title
		fullView: boolean
		notification: notifiactionString
]

{ #category : #accessing }
ITDebug >> process: anObject [
	process := anObject
]

{ #category : #accessing }
ITDebug >> title: anObject [
	title := anObject
]
