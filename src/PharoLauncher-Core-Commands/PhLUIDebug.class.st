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

{ #category : #accessing }
PhLUIDebug >> boolean [
	^ boolean
]

{ #category : #accessing }
PhLUIDebug >> boolean: anObject [
	boolean := anObject
]

{ #category : #accessing }
PhLUIDebug >> context [
	^ context
]

{ #category : #accessing }
PhLUIDebug >> context: anObject [
	context := anObject
]

{ #category : #accessing }
PhLUIDebug >> notifiactionString [
	^ notifiactionString
	
]

{ #category : #accessing }
PhLUIDebug >> notifiactionString:  anObject [
	notifiactionString := anObject
]

{ #category : #action }
PhLUIDebug >> openDebuger [
	^ UIManager default
		debugProcess: process
		context: context
		label: title
		fullView: boolean
		notification: notifiactionString
]

{ #category : #accessing }
PhLUIDebug >> process [
	^ process
]

{ #category : #accessing }
PhLUIDebug >> process: anObject [
	process := anObject
]

{ #category : #accessing }
PhLUIDebug >> title [
	^ title
]

{ #category : #accessing }
PhLUIDebug >> title: anObject [
	title := anObject
]
