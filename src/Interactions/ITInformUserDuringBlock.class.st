Class {
	#name : #ITInformUserDuringBlock,
	#superclass : #Object,
	#instVars : [
		'string',
		'block'
	],
	#category : #Interactions
}

{ #category : #accessing }
ITInformUserDuringBlock >> block: anObject [
	block := anObject
]

{ #category : #action }
ITInformUserDuringBlock >> informUserDuring [
	^ UIManager default informUser: string during: block
]

{ #category : #action }
ITInformUserDuringBlock >> informUserDuringBlock [
	^ UIManager default informUserDuring: block
]

{ #category : #accessing }
ITInformUserDuringBlock >> string: anObject [
	string := anObject
]
