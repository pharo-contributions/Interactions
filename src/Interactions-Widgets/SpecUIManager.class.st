Class {
	#name : 'SpecUIManager',
	#superclass : 'UIManager',
	#category : 'Interactions-Widgets',
	#package : 'Interactions-Widgets'
}

{ #category : 'ui requests' }
SpecUIManager >> inform: anITInformation [
	^ (ITInformationPresenter on: anITInformation) openDialogWithSpec
]
