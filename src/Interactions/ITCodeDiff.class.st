Class {
	#name : #ITCodeDiff,
	#superclass : #Object,
	#instVars : [
		'sourceCode',
		'destCode',
		'classBehavior',
		'change'
	],
	#classVars : [
		'Default'
	],
	#category : #Interactions
}

{ #category : #accessing }
ITCodeDiff >> change: anObject [
	change := anObject
]

{ #category : #accessing }
ITCodeDiff >> classBehavior: anObject [
	classBehavior := anObject
]

{ #category : #accessing }
ITCodeDiff >> destCode: anObject [
	destCode := anObject
]

{ #category : #running }
ITCodeDiff >> run [
	self subclassResponsibility.
	"when I migrated this component there was any implementation of thismethod 
	may be we should removeIt"
	^ UIManager default
		openComparisionFrom: sourceCode
		to: destCode
		belongingTo: classBehavior
		from: change
]

{ #category : #accessing }
ITCodeDiff >> sourceCode: anObject [
	sourceCode := anObject
]
