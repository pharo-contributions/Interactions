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
