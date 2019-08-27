Class {
	#name : #UIManager2,
	#superclass : #Object,
	#classVars : [
		'Default'
	],
	#category : #Interactions
}

{ #category : #initialization }
UIManager2 class >> default [
	^ Default
		ifNil: [ 
			"Note: The way the following is phrased ensures that you can always make 'more specific' managers merely by subclassing a tool builder and implementing a more specific way of reacting to #isActiveManager. For example, a BobsUIManager can subclass MorphicUIManager and will be considered before the parent (generic MorphicUIManager)."
			self allSubclasses
				detect: [ :any | any isActiveManager and: [ any subclasses noneSatisfy: [ :sub | sub isActiveManager ] ] ]
				ifFound: [ :mgrClass | Default := mgrClass new ].
			Default ]
]

{ #category : #initialization }
UIManager2 class >> default: aUIManager [

	Default ifNotNil: [ :mgr | mgr deactivate ].
	Default := aUIManager.
	Default activate
]

{ #category : #initialization }
UIManager2 class >> forCurrentSystemConfiguration [
	^(self allSubclasses
			detect: [ :any | 
				any isValidForCurrentSystemConfiguration
					and: [ any subclasses noneSatisfy: #isValidForCurrentSystemConfiguration ] ]
			ifNone: [ NonInteractiveUIManager ]) new
]

{ #category : #initialization }
UIManager2 class >> isActiveManager [
	"Answer whether I should act as the active UI manager."
	
	^false
]

{ #category : #testing }
UIManager2 class >> isValidForCurrentSystemConfiguration [

	^false
]

{ #category : #utilities }
UIManager2 class >> nonInteractiveDuring: aBlock [
	| currentManager |
	currentManager := self default.
	currentManager nonInteractiveManager.
	
	aBlock ensure: [ currentManager beDefault ]
]

{ #category : #'ui TEasilyThemed' }
UIManager2 >> abort: aStringOrText [
	"Open an error dialog."
self deprecated: 'reification'.
	^self subclassResponsibility 
]

{ #category : #'ui TEasilyThemed' }
UIManager2 >> abort: aStringOrText title: aString [
	"Open an error dialog."
self deprecated: 'reification'.
	^self subclassResponsibility 
]

{ #category : #private }
UIManager2 >> activate [
]

{ #category : #'ui TEasilyThemed' }
UIManager2 >> alert: aStringOrText [
	"Open an alert dialog."
	self deprecated: 'reification'.
	^self subclassResponsibility
]

{ #category : #'ui TEasilyThemed' }
UIManager2 >> alert: aStringOrText title: aString [
	"Open an alert dialog."
	self deprecated: 'reification'.
	^self subclassResponsibility 
]

{ #category : #'ui TEasilyThemed' }
UIManager2 >> alert: aStringOrText title: aString configure: aBlock [
	"Open an alert dialog.
	 Configure the dialog with the 1 argument block before opening modally."
	self deprecated: 'deprecated'.
	^self subclassResponsibility 
]

{ #category : #private }
UIManager2 >> beDefault [

	self class default: self
]

{ #category : #'ui requests' }
UIManager2 >> chooseDirectory [
	"Let the user choose a directory."
	
	^self chooseDirectoryFrom: FileSystem workingDirectory
]

{ #category : #'ui requests' }
UIManager2 >> chooseDirectory: label [
	"Let the user choose a directory."

	^self chooseDirectory: label from: FileSystem workingDirectory
]

{ #category : #'ui requests' }
UIManager2 >> chooseDirectory: label from: dir [
	"Let the user choose a directory."

	^self subclassResponsibility
]

{ #category : #'ui requests' }
UIManager2 >> chooseDirectoryFrom: dir [
	"Let the user choose a directory"

	^self chooseDirectory: nil from: dir
]

{ #category : #'ui requests' }
UIManager2 >> chooseFrom: aList [
	"Choose an item from the given list. Answer the index of the selected item."
	
	^self chooseFrom: aList lines: #()
]

{ #category : #'ui requests' }
UIManager2 >> chooseFrom: aList lines: linesArray [
	"Choose an item from the given list. Answer the index of the selected item."
	
	^self chooseFrom: aList lines: linesArray title: ''
]

{ #category : #'ui requests' }
UIManager2 >> chooseFrom: aList lines: linesArray message: messageString [
	"Choose an item from the given list. Answer the index of the selected item."
	
	^self chooseFrom: aList lines: linesArray message: messageString title: ''
]

{ #category : #'ui requests' }
UIManager2 >> chooseFrom: aList lines: linesArray message: messageString title: aString [
	"Choose an item from the given list. Answer the selected item."
	
	^self
		chooseFrom: aList
		lines: linesArray
		title: (aString 
				ifEmpty: [ messageString ]
				ifNotEmpty: [ aString, String cr, messageString ])
]

{ #category : #'ui requests' }
UIManager2 >> chooseFrom: aList lines: linesArray title: aString [
	"Choose an item from the given list. Answer the index of the selected item."
	
	^self subclassResponsibility
]

{ #category : #'ui requests' }
UIManager2 >> chooseFrom: aList message: messageString [
	"Choose an item from the given list. Answer the index of the selected item."
	
	^self chooseFrom: aList lines: #() message: messageString
]

{ #category : #'ui requests' }
UIManager2 >> chooseFrom: aList message: messageString title: aString [
	"Choose an item from the given list. Answer the index of the selected item."
	
	^self chooseFrom: aList lines: #() message: messageString title: aString
]

{ #category : #'ui requests' }
UIManager2 >> chooseFrom: aList title: aString [
	"Choose an item from the given list. Answer the index of the selected item."
	
	^self chooseFrom: aList lines: #() title: aString
]

{ #category : #'ui requests' }
UIManager2 >> chooseFrom: labelList values: valueList [
	"Choose an item from the given list. Answer the selected item."
	
	^self chooseFrom: labelList values: valueList lines: #()
]

{ #category : #'ui requests' }
UIManager2 >> chooseFrom: labelList values: valueList lines: linesArray [
	"Choose an item from the given list. Answer the selected item."
	
	^self chooseFrom: labelList values: valueList lines: linesArray title: ''
]

{ #category : #'ui requests' }
UIManager2 >> chooseFrom: aList values: valueList lines: linesArray message: messageString [
	"Choose an item from the given list. Answer the index of the selected item."
	
	^self chooseFrom: aList values: valueList lines: linesArray message: messageString title: ''
]

{ #category : #'ui requests' }
UIManager2 >> chooseFrom: labelList values: valueList lines: linesArray message: messageString title: aString [
	"Choose an item from the given list. Answer the selected item."
	
	^self
		chooseFrom: labelList
		values: valueList 
		lines: linesArray
		title: (aString 
				ifEmpty: [ messageString ]
				ifNotEmpty: [ aString, String cr, messageString ])
]

{ #category : #'ui requests' }
UIManager2 >> chooseFrom: labelList values: valueList lines: linesArray title: aString [
	"Choose an item from the given list. Answer the selected item."
	
	^self subclassResponsibility
]

{ #category : #'ui requests' }
UIManager2 >> chooseFrom: aList values: valueList message: messageString [
	"Choose an item from the given list. Answer the index of the selected item."
	
	^self chooseFrom: aList values: valueList lines: #() message: messageString
]

{ #category : #'ui requests' }
UIManager2 >> chooseFrom: aList values: valueList message: messageString title: aString [
	"Choose an item from the given list. Answer the index of the selected item."
	
	^self chooseFrom: aList values: valueList lines: #() message: messageString title: aString
]

{ #category : #'ui requests' }
UIManager2 >> chooseFrom: labelList values: valueList title: aString [
	"Choose an item from the given list. Answer the selected item."
	
	^self chooseFrom: labelList values: valueList lines: #() title: aString
]

{ #category : #'ui requests' }
UIManager2 >> chooseFullFileNameMatching: patterns [
	"Let the user choose a file matching the given patterns"
	
	^self chooseFullFileNameMatching: patterns label: nil
]

{ #category : #'ui requests' }
UIManager2 >> chooseFullFileNameMatching: patterns label: labelString [
	"Let the user choose a file matching the given patterns"
	
	^self subclassResponsibility
]

{ #category : #'ui requests' }
UIManager2 >> chooseOrRequestFrom: labelList values: valueList lines: linesArray title: aString [

	^self subclassResponsibility
]

{ #category : #'ui requests' }
UIManager2 >> confirm: queryString [
	"Put up a yes/no menu with caption queryString. Answer true if the 
	response is yes, false if no. This is a modal question--the user must 
	respond yes or no."
	
	^self subclassResponsibility
]

{ #category : #'ui requests' }
UIManager2 >> confirm: queryString label: titleString [
	
	^self subclassResponsibility
]

{ #category : #'ui requests' }
UIManager2 >> confirm: queryString label: title trueChoice: trueChoice falseChoice: falseChoice cancelChoice: cancelChoice default: defaultOption [
	"Put up a yes/no/cancel menu with caption queryString. The actual wording for the choices will be as provided in the trueChoice, falseChoice and cancelChoice parameters.
	defaultOption should be one of true, false or nil to set the default button.
	Answer true if the response is the true-choice, false if it's the false-choice, nil if the cancelChoice.
	This is a modal question -- the user must respond."
	
	^self subclassResponsibility
]

{ #category : #'ui requests' }
UIManager2 >> confirm: aString orCancel: cancelBlock [
	"Put up a yes/no/cancel menu with caption aString. Answer true if  
	the response is yes, false if no. If cancel is chosen, evaluate  
	cancelBlock. This is a modal question--the user must respond yes or no."
	
	^self subclassResponsibility
]

{ #category : #'ui requests' }
UIManager2 >> confirm: queryString trueChoice: trueChoice falseChoice: falseChoice [ 
	"Put up a yes/no menu with caption queryString. The actual wording for the two choices will be as provided in the trueChoice and falseChoice parameters. Answer true if the response is the true-choice, false if it's the false-choice.
	This is a modal question -- the user must respond one way or the other."
	
	^self subclassResponsibility
]

{ #category : #'ui requests' }
UIManager2 >> confirm: queryString trueChoice: trueChoice falseChoice: falseChoice cancelChoice: cancelChoice default: aSymbol [
	"Put up a yes/no/cancel menu with caption queryString. The actual wording for the choices will be as provided in the trueChoice, falseChoice and cancelChoice parameters.
	Default should be one of #yes, #no or #cancel to set the default button.
	Answer true if the response is the true-choice, false if it's the false-choice, nil if the cancelChoice.
	This is a modal question -- the user must respond."
	
	^self subclassResponsibility
]

{ #category : #private }
UIManager2 >> deactivate [
]

{ #category : #debug }
UIManager2 >> debugProcess: process context: context label: title fullView: bool [
	self deprecated: 'use ITDebug instead'.
	self debugProcess: process context: context label: title fullView: bool notification: nil
]

{ #category : #debug }
UIManager2 >> debugProcess: process context: context label: title fullView: bool notification: notificationString [
	self deprecated: ''.
	self subclassResponsibility
]

{ #category : #'ui process' }
UIManager2 >> defer: aBlock [
	"Evaluate the given Block in the UI thread as soon as there is nothing scheduled. 
	 Evaluate immediately when there is no UI"
	
	aBlock value
]

{ #category : #'ui TEasilyThemed' }
UIManager2 >> deny: aStringOrText [
	"Open a denial dialog."
	 self deprecated: 'reification'.
	^self subclassResponsibility 
]

{ #category : #'ui TEasilyThemed' }
UIManager2 >> deny: aStringOrText title: aString [
	"Open a denial dialog."
self deprecated: 'reification'.
	^self subclassResponsibility 
]

{ #category : #display }
UIManager2 >> displayProgress: titleString from: minVal to: maxVal during: workBlock [
	"SystemProgressMorph show: titleString from: minVal to:  during: "

	^ workBlock asJob
			title: titleString;
			min: minVal;
			max: maxVal;
			run
]

{ #category : #'ui requests' }
UIManager2 >> edit: aText [
	"Open an editor on the given string/text."
	
	^self edit: aText label: nil
]

{ #category : #'ui requests' }
UIManager2 >> edit: aText label: labelString [
	"Open an editor on the given string/text."
	
	^self edit: aText label: labelString accept: nil
]

{ #category : #'ui requests' }
UIManager2 >> edit: aText label: labelString accept: aBlockOrNil [
	"Open an editor on the given string/text."
	
	^self subclassResponsibility
]

{ #category : #'ui requests' }
UIManager2 >> fontFromUser: priorFont [	
	
	self subclassResponsibility
]

{ #category : #'error handling' }
UIManager2 >> handleError: anError [
	self deprecated: 'Store into ITError'.
	self handleError: anError log: true
]

{ #category : #'error handling' }
UIManager2 >> handleError: anError log: shouldLog [
	self deprecated: 'Store into ITError'.
	self subclassResponsibility
]

{ #category : #accessing }
UIManager2 >> headlessManager [
	"Answer an instance of headless manager, which will be used when image runs headless 
	 and non-interactive. We put it here, so subclasses can override it."
	
	^CommandLineUIManager replacing: self
]

{ #category : #'ui requests' }
UIManager2 >> inform: aString [
	"Display a message for the user to read and then dismiss."
	
	^self subclassResponsibility
]

{ #category : #'ui requests' }
UIManager2 >> informUser: aString during: aBlock [
	"Display a message above (or below if insufficient room) the cursor 
	 during execution of the given block.
		UIManager default informUser: 'Just a sec!' during: [(Delay forSeconds: 1) wait].
	"
	
	^self informUserDuring: [:bar | bar label: aString. aBlock value]
]

{ #category : #'ui requests' }
UIManager2 >> informUserDuring: aBlock [
	"Display a message above (or below if insufficient room) the cursor 
	during execution of the given block.
		UIManager default informUserDuring:[:bar|
			#(one two three) do:[:info|
				bar label: info.
				(Delay forSeconds: 1) wait]]"
		
	^self subclassResponsibility
]

{ #category : #'ui process' }
UIManager2 >> interruptName: labelString preemptedProcess: theInterruptedProcess [
	"Create a Notifier on the active scheduling process with the given label."

	^self error: 'Cannot perform a given request'
]

{ #category : #'error handling' }
UIManager2 >> logError: anError [
	self flag: #moveToITError.
	Smalltalk
		logError: anError messageText
		inContext: anError signalerContext
]

{ #category : #'default actions' }
UIManager2 >> lowSpaceWatcherDefaultAction: preemptedProcess [
]

{ #category : #'ui requests' }
UIManager2 >> merge: merger informing: aString [

	self subclassResponsibility
]

{ #category : #'ui requests' }
UIManager2 >> multiLineRequest: queryString initialAnswer: defaultAnswer answerHeight: answerHeight [
	"Create a multi-line instance of me whose question is queryString with
	 the given initial answer. Invoke it centered at the given point, and
	 answer the string the user accepts.  Answer nil if the user cancels.  An
	 empty string returned means that the ussr cleared the editing area and
	 then hit 'accept'.  Because multiple lines are invited, we ask that the user
	 use the ENTER key, or (in morphic anyway) hit the 'accept' button, to 
	 submit; that way, the return key can be typed to move to the next line."
	self deprecated: ''.
	^self subclassResponsibility
]

{ #category : #display }
UIManager2 >> newDisplayDepthNoRestore: pixelSize [	
	
	self subclassResponsibility 
]

{ #category : #'ui requests' }
UIManager2 >> newMenuIn: aThemedMorph for: aModel [
	"Answer a new menu."
	self deprecated: 'storeIntoITMenuInFor'.
	^self subclassResponsibility
]

{ #category : #'non-interactive' }
UIManager2 >> nonInteractiveManager [
	"Answer an instance of non-interactive manager, which will be used when image runs headless.
	 We put it here, so subclasses can override it."
	
	^NonInteractiveUIManager replacing: self
]

{ #category : #events }
UIManager2 >> onEventSensorStartup: anEventSensor [


]

{ #category : #'default actions' }
UIManager2 >> onFontsChanged [

	
]

{ #category : #events }
UIManager2 >> onPrimitiveError: aString [	
	self deprecated: #storeIntoITPrimitiveError.
]

{ #category : #'ui requests' }
UIManager2 >> openComparisionFrom: targetMethodSource to: originalMethodSource belongingTo: aClass from: aChange [
	self flag: #notImplementor.
	self deprecated: 'store into ITCodeDiff'.
	^self subclassResponsibility				
]

{ #category : #'ui TEasilyThemed' }
UIManager2 >> proceed: aStringOrText [
	"Open a proceed dialog."
	self deprecated: 'reification'.
	^self subclassResponsibility 
]

{ #category : #'ui TEasilyThemed' }
UIManager2 >> proceed: aStringOrText title: aString [
	"Open a proceed dialog and answer true if not cancelled, false otherwise."
	self deprecated: 'reification'.
	^self subclassResponsibility 
]

{ #category : #'ui TEasilyThemed' }
UIManager2 >> question: aStringOrText [
	"Open a question dialog."
	self deprecated: ''.
	^self subclassResponsibility 
]

{ #category : #'ui TEasilyThemed' }
UIManager2 >> question: aStringOrText title: aString [
	"Open a question dialog and answer true if yes,
	 false if no and nil if cancelled."
self deprecated: ''.
	^self subclassResponsibility 
]

{ #category : #'ui TEasilyThemed' }
UIManager2 >> questionWithoutCancel: aStringOrText [
	"Open a question dialog."
	self deprecated: ''.
	^self subclassResponsibility 
]

{ #category : #'ui TEasilyThemed' }
UIManager2 >> questionWithoutCancel: aStringOrText title: aString [
	"Open a question dialog and answer true if yes,
	 false if no and nil if cancelled."
self deprecated: ''.
	^self subclassResponsibility 
]

{ #category : #'ui requests' }
UIManager2 >> request: queryString [ 
	"Create an instance of me whose question is queryString. Invoke it 
	 centered at the cursor, and answer the string the user accepts. Answer 
	 the empty string if the user cancels."
	self flag: #sameA.
	self deprecated: ''.
	^self request: queryString initialAnswer: ''
]

{ #category : #'ui requests' }
UIManager2 >> request: queryString entryCompletion: anEntryCompletion [
	"Create an instance of me whose question is queryString. Invoke it 
	 centered at the cursor, and answer the string the user accepts. Answer 
	 the empty string if the user cancels."
	self flag: #sameA.
	self deprecated: ''.
	^self request: queryString initialAnswer: '' entryCompletion: anEntryCompletion
]

{ #category : #'ui requests' }
UIManager2 >> request: queryString initialAnswer: defaultAnswer [
	"Create an instance of me whose question is queryString with the given initial answer. Answer the 
	 string the user accepts. Answer the empty string if the user cancels."
	self flag: #sameA.
self deprecated: ''.
	^self subclassResponsibility
]

{ #category : #'ui requests' }
UIManager2 >> request: queryString initialAnswer: defaultAnswer entryCompletion: anEntryCompletion [
	"Create an instance of me whose question is queryString with the given 
	 initial answer. Invoke it centered at the given point, and answer the 
	 string the user accepts. Answer the empty string if the user cancels."
	self flag: #sameA.
	self deprecated: ''.
	^self subclassResponsibility
]

{ #category : #'ui requests' }
UIManager2 >> request: aStringOrText initialAnswer: defaultAnswer title: aTitle [
	"Create an instance of me whose question is queryString with the given 
	 initial answer. Invoke it centered at the given point, and answer the 
	 string the user accepts. Answer the empty string if the user cancels."
	self flag: #sameA. 
	self deprecated: ''.
	^self subclassResponsibility
]

{ #category : #'ui requests' }
UIManager2 >> request: aStringOrText initialAnswer: defaultAnswer title: aTitle entryCompletion: anEntryCompletion [
	"Create an instance of me whose question is queryString with the given 
	 initial answer. Invoke it centered at the given point, and answer the 
	 string the user accepts. Answer the empty string if the user cancels."
	self flag: #sameA.
	self deprecated: ''.
	^self subclassResponsibility
]

{ #category : #'ui requests' }
UIManager2 >> requestPassword: queryString [
	"Create an instance of me whose question is queryString. Invoke it centered
	 at the cursor, and answer the string the user accepts. Answer the empty 
	 string if the user cancels."
	self deprecated: ''.
	^self subclassResponsibility
]

{ #category : #display }
UIManager2 >> restoreDisplay [	
	
	self subclassResponsibility 
]

{ #category : #display }
UIManager2 >> restoreDisplayAfter: aBlock [	
	
	self subclassResponsibility 
]

{ #category : #display }
UIManager2 >> showWaitCursorWhile: aBlock [
	| process |
	process := [ [ true ] "loop until the end of aBlock processing"
		whileTrue: [ 
			Smalltalk logStdErrorDuring: [ :stream |
				"Wait wheel in ASCII art"
				'\|/-'
					do: [ :char |
						stream << char.
						0.1 second wait.
						stream << Character backspace ] ] ] ] fork.
	[ aBlock value ]
		ensure: [ process terminate ]
]

{ #category : #'ui process' }
UIManager2 >> spawnNewProcess [
	"Do nothing by default."
]

{ #category : #'ui process' }
UIManager2 >> spawnNewProcessIfThisIsUI: suspendedProcess [

	self uiProcess == suspendedProcess ifTrue: [
		self spawnNewProcess.
		^true
	].
	^false		"no new process was created"

]

{ #category : #'default actions' }
UIManager2 >> syntaxErrorNotificationDefaultAction: anException [

	^ self subclassResponsibility 
]

{ #category : #'ui process' }
UIManager2 >> terminateUIProcess [
	"Do nothing by default."
]

{ #category : #'ui TEasilyThemed' }
UIManager2 >> textEntry: aStringOrText [
	"Open a text entry dialog."
	self flag: #sameA.
	self deprecated: ''.
	^self subclassResponsibility 
]

{ #category : #'ui TEasilyThemed' }
UIManager2 >> textEntry: aStringOrText title: aString [
	"Open a text entry dialog."
	self flag: #sameA.
self deprecated: ''.
	^self subclassResponsibility 
]

{ #category : #'ui TEasilyThemed' }
UIManager2 >> textEntry: aStringOrText title: aString entryText: defaultEntryText [
	"Open a text entry dialog."
	self flag: #sameA.
self deprecated: ''.
	^self subclassResponsibility 
]

{ #category : #'default actions' }
UIManager2 >> unhandledErrorDefaultAction: anException [
	"Provide a default handling for unhandled error. 
	 We should never reach this code, because it should be overridden by subclasses. 
	 (but we can't put 'self subclassResponsibility' , because it will cause infinite loop,
	 in case if current ui manager having no override of this method).
	 This method is only for documentation purposes."
		
	Smalltalk snapshot: false andQuit: true.
]

{ #category : #'default actions' }
UIManager2 >> warningDefaultAction: aWarning [
	"Handle warning notification. Should be overidden by subclass."
	
	self subclassResponsibility  
]
