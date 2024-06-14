Extension { #name : 'SpConfirmDialog' }

{ #category : '*Interactions-Widgets' }
SpConfirmDialog class >> for: aConfirmation [

	^ self new
		title: aConfirmation title;
		label: aConfirmation message;
		acceptLabel: aConfirmation yesLabel;
		cancelLabel: aConfirmation noLabel;
		yourself
]
