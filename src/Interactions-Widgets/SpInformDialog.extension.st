Extension { #name : 'SpInformDialog' }

{ #category : '*Interactions-Widgets' }
SpInformDialog class >> for: anITInformation [ 
	
	^ self new
		title: anITInformation title;
		label: anITInformation message;
		yourself
]
