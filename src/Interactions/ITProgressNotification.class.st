"
I notify the user of the progress of the current action.
"
Class {
	#name : #ITProgressNotification,
	#superclass : #Object,
	#instVars : [
		'string',
		'block'
	],
	#category : #Interactions
}

{ #category : #accessing }
ITProgressNotification >> block: aBlock [
	"
	aBlock could be this
	[:bar|
			#(one two three) do:[:info|
				bar label: info.
				(Delay forSeconds: 1) wait]]"
	block := aBlock
]

{ #category : #action }
ITProgressNotification >> informUserDuring [
	^ UIManager default informUser: string during: block
]

{ #category : #action }
ITProgressNotification >> informUserDuringBlock [
	^ UIManager default informUserDuring: block
]

{ #category : #accessing }
ITProgressNotification >> string: aString [
	string := aString
]
