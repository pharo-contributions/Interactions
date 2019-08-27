Class {
	#name : #ITMenuInFor,
	#superclass : #Object,
	#instVars : [
		'themedMorph',
		'model'
	],
	#category : #Interactions
}

{ #category : #accessing }
ITMenuInFor >> model: anObject [
	model := anObject
]

{ #category : #running }
ITMenuInFor >> run [
	^ UIManager default newMenuIn: themedMorph for: model
]

{ #category : #accessing }
ITMenuInFor >> themedMorph: anObject [
	themedMorph := anObject
]
