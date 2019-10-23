"
I represent a user interaction to confirm an intent.
I can be canceled, approved or denied.
My actions labels can be customized.
"
Class {
	#name : #ITConfirmation,
	#superclass : #ITUserInteraction,
	#instVars : [
		'cancelLabel',
		'cancelBlock',
		'falseLabel',
		'trueLabel',
		'defaultChoice'
	],
	#category : #Interactions
}

{ #category : #example }
ITConfirmation class >> example [
	^ self new
		message: 'I''m a reification of a confirmation to be delivered to the user';
		title: 'ITConfirmation example';
		yourself
]

{ #category : #accessing }
ITConfirmation >> cancelBlock: aBlock [
	cancelBlock := aBlock
]

{ #category : #accessing }
ITConfirmation >> cancelLabel [
	^ cancelLabel ifNil: [ cancelLabel := 'cancel' ]
]

{ #category : #accessing }
ITConfirmation >> cancelLabel: aString [
	cancelLabel := aString
]

{ #category : #action }
ITConfirmation >> confirm [
	^ UIManager default
		confirm: message
		trueChoice: self yesLabel
		falseChoice: self noLabel
		cancelChoice: self cancelLabel
		default: self defaultChoice
]

{ #category : #action }
ITConfirmation >> confirmWithCancelBlock [
	^ UIManager default confirm: message orCancel: cancelBlock
]

{ #category : #accessing }
ITConfirmation >> defaultChoice [
	^ defaultChoice
]

{ #category : #accessing }
ITConfirmation >> defaultChoice: aSymbol [
	#(#true #false #nil) 
		detect: aSymbol ifNone: [ self error: aSymbol, ' is not a valid choice!' ].
		
	defaultChoice := aSymbol
]

{ #category : #accessing }
ITConfirmation >> noLabel [
	^ falseLabel ifNil: [ falseLabel := 'no' ]
]

{ #category : #accessing }
ITConfirmation >> noLabel: aString [
	falseLabel := aString
]

{ #category : #action }
ITConfirmation >> proceed [
	^ UIManager default proceed: message title: title
]

{ #category : #action }
ITConfirmation >> question [
	^ UIManager default question: message title: title
]

{ #category : #action }
ITConfirmation >> questionWithoutCancel [
	^ UIManager default questionWithoutCancel: message title: title
]

{ #category : #accessing }
ITConfirmation >> yesLabel [
	^ trueLabel ifNil: [ trueLabel := 'yes' ]
]

{ #category : #accessing }
ITConfirmation >> yesLabel: aString [
	trueLabel := aString
]
