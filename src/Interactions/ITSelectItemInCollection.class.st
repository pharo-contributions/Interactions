Class {
	#name : #ITSelectItemInCollection,
	#superclass : #Object,
	#instVars : [
		'keyCollection',
		'valueCollection',
		'message',
		'title',
		'linesArray'
	],
	#category : #Interactions
}

{ #category : #accessing }
ITSelectItemInCollection >> keyCollection: anObject [
	keyCollection  := anObject
]

{ #category : #accessing }
ITSelectItemInCollection >> linesArray: anObject [
	linesArray := anObject
]

{ #category : #accessing }
ITSelectItemInCollection >> message: anObject [
	message := anObject
]

{ #category : #running }
ITSelectItemInCollection >> run [
	UIManager default
		chooseFrom: keyCollection
		values: valueCollection
		lines: linesArray
		message: message
		title: title
]

{ #category : #accessing }
ITSelectItemInCollection >> title: anObject [
	title := anObject
]

{ #category : #accessing }
ITSelectItemInCollection >> valueCollection: anObject [
	valueCollection  := anObject
]
