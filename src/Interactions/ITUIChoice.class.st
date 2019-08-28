"
I represent an interaction where I ask the user to choose between different values.
Values are provided with a collection of objects.
"
Class {
	#name : #ITUIChoice,
	#superclass : #ITUserInteraction,
	#instVars : [
		'items',
		'displayBlock'
	],
	#category : #Interactions
}

{ #category : #accessing }
ITUIChoice >> displayBlock: aBlock [ 
	displayBlock := aBlock 
]

{ #category : #initialization }
ITUIChoice >> initialize [ 
	displayBlock := [ :item | item name ]
]

{ #category : #accessing }
ITUIChoice >> items: aCollection [
	items := aCollection
]

{ #category : #running }
ITUIChoice >> run [
	UIManager default
		chooseFrom: (displayBlock value: items)
		values: items
		lines: #()
		message: message
		title: title
]
