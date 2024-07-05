Extension { #name : 'SpInformDialog' }

{ #category : '*Interactions-Widgets' }
SpInformDialog class >> for: anITInformation [ 

	^ (self newApplication: anITInformation application owner: anITInformation parentWindow)
		title: anITInformation title;
		label: anITInformation message;
		yourself
]
