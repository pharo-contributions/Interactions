Extension { #name : 'StFileSystemPresenter' }

{ #category : '*Interactions-Widgets' }
StFileSystemPresenter >> doInteraction [
	
	^ self openModal
]

{ #category : '*Interactions-Widgets' }
StFileSystemPresenter class >> for: aFileRequest [

	^ self new
		title: aFileRequest title;
		yourself
]
