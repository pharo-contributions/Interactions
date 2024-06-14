"
I represent an information to be communicated to the user.
I can be configured to be an information of different types: abort, access denied, alert.

"
Class {
	#name : 'ITInformation',
	#superclass : 'ITUserInteractionWithMessage',
	#instVars : [
		'type'
	],
	#category : 'Interactions',
	#package : 'Interactions'
}

{ #category : 'example' }
ITInformation class >> example [ 
	^ self new 
		message: 'I''m a reification of an information to be delivered to the user';
		title: 'ITInformation example';
		beAlert;
		yourself
]

{ #category : 'configuring' }
ITInformation >> beAbort [
	type := #abort.
	title ifNil: [ title := 'Error' translated ]
]

{ #category : 'configuring' }
ITInformation >> beAccessDenied [
	type := #deny.
	title ifNil: [ title := 'Access Denied' translated ]
]

{ #category : 'configuring' }
ITInformation >> beAlert [
	type := #alert.
	title ifNil: [ title := 'Alert!' translated ]
]

{ #category : 'accessing' }
ITInformation >> type [ 
	^ type
]

{ #category : 'private' }
ITInformation >> widgetFor: aBackend [

	^ aBackend widgetForInformation: self
]
