Class {
	#name : #PhLUIInformation,
	#superclass : #Object,
	#instVars : [
		'message',
		'aBlock'
	],
	#category : #'PharoLauncher-Core-Commands'
}

{ #category : #accessing }
PhLUIInformation >> aBlock: block [
	aBlock := block
]

{ #category : #action }
PhLUIInformation >> informUserDuring [

	^ UIManager default informUser: message during: aBlock
]
