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

{ #category : #accessing }
ITConfirmation >> cancelBlock: anObject [
	cancelBlock := anObject
]

{ #category : #getteur }
ITConfirmation >> cancelLabel [
	^ cancelLabel ifNil: [ cancelLabel := 'cancel' ]
]

{ #category : #accessing }
ITConfirmation >> cancelLabel: aStringUseAsLabelForButton [
	cancelLabel := aStringUseAsLabelForButton
]

{ #category : #action }
ITConfirmation >> confirm [
	^ UIManager default
		confirm: message
		trueChoice: self trueLabel
		falseChoice: self falseLabel
		cancelChoice: self cancelLabel
		default: self defaultChoice
]

{ #category : #action }
ITConfirmation >> confirmWithCancelBlock [
	^ UIManager default confirm: message orCancel: cancelBlock
]

{ #category : #getteur }
ITConfirmation >> defaultBoolean [
	^ defaultChoice ifNil: [ defaultChoice := nil ]
]

{ #category : #getteur }
ITConfirmation >> defaultChoice [
	^ defaultChoice ifNil: [ defaultChoice := nil ]
]

{ #category : #accessing }
ITConfirmation >> defaultChoice: boolean [
	"aSymbol have to be:
		true
		false
		nil
		"
	defaultChoice := boolean
]

{ #category : #getteur }
ITConfirmation >> falseLabel [
	^ falseLabel ifNil: [ falseLabel := 'no' ]
]

{ #category : #accessing }
ITConfirmation >> noLabel: aStringUseAsLabelForButton [
	falseLabel := aStringUseAsLabelForButton
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

{ #category : #getteur }
ITConfirmation >> trueLabel [
	^ trueLabel ifNil: [ trueLabel := 'yes' ]
]

{ #category : #accessing }
ITConfirmation >> yesLabel: aStringUseAsLabelForButton [
	trueLabel := aStringUseAsLabelForButton
]
