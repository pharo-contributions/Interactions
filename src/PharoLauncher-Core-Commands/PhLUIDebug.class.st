Class {
	#name : #PhLUIDebug,
	#superclass : #Object,
	#instVars : [
		'process',
		'context',
		'title',
		'boolean',
		'notifiactionString'
	],
	#category : #'PharoLauncher-Core-Commands'
}

{ #category : #initialization }
PhLUIDebug >> initialize [
	super initialize.
	boolean := false.
	title := ''
]

{ #category : #accessing }
PhLUIDebug >> notifiactionString:  anObject [
	notifiactionString := anObject
]

{ #category : #action }
PhLUIDebug >> open [
	^ UIManager default
		debugProcess: process
		context: context
		label: title
		fullView: boolean
		notification: notifiactionString
]
