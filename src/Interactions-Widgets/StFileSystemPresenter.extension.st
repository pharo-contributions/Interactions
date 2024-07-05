Extension { #name : 'StFileSystemPresenter' }

{ #category : '*Interactions-Widgets' }
StFileSystemPresenter >> doInteraction [
	
	^ self openModal
]

{ #category : '*Interactions-Widgets' }
StFileSystemPresenter class >> for: aFileRequest [

	^ (self new"Application: aFileRequest application owner: aFileRequest parentWindow model: StFileSystemModel new")
		title: aFileRequest title;
		yourself
]
