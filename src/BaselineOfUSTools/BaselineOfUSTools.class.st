Class {
	#name : #BaselineOfUSTools,
	#superclass : #BaselineOf,
	#category : #BaselineOfUSTools
}

{ #category : #'as yet unclassified' }
BaselineOfUSTools class >> loadLocal [

	Metacello new
		repository:
			'tonel://'
			, (FileLocator localDirectory / 'iceberg' / 'udoschneider'
				 / 'ustools-pharo' / 'src') pathString;
		baseline: #USTools;
		load
]

{ #category : #baselines }
BaselineOfUSTools >> baseline: spec [

	<baseline>
	spec for: #common do: [ 
		spec blessing: #baseline.
		spec author: 'Udo Schneider'.
		self
			magritte: spec;
			neoJson: spec;
			seaside: spec;
			pillar: spec;
			qcmagritte: spec;
			renoirSt: spec.
		spec
			package: 'USTools-Misc';
			package: 'USTools-Magritte'
			with: [ spec requires: #( 'Magritte' ) ];
			package: 'USTools-Magritte-NeoJSON'
			with: [ 
				spec requires: #( 'Magritte' 'NeoJSON' 'USTools-Magritte' ) ];
			package: 'USTools-Magritte-Seaside'
			with: [ 
				spec requires: #( 'Magritte' 'Seaside3' 'USTools-Magritte' ) ];
			package: 'USTools-Pillar' with: [ spec requires: #( 'Pillar' ) ];
			package: 'USTools-QCMagritte'
			with: [ spec requires: #( 'QCMagritte' 'USTools-Magritte' ) ];
			package: 'USTools-RenoirSt'
			with: [ spec requires: #( 'RenoirSt' ) ] ]
]

{ #category : #dependencies }
BaselineOfUSTools >> magritte: spec [

	spec baseline: 'Magritte' with: [ 
		spec
			repository: 'github://magritte-metamodel/magritte:master';
			loads: #( 'Magritte-Model' ) ]
]

{ #category : #dependencies }
BaselineOfUSTools >> neoJson: spec [

	spec
		baseline: 'NeoJSON'
		with: [ spec repository: 'github://svenvc/NeoJSON/repository' ]
]

{ #category : #dependencies }
BaselineOfUSTools >> pillar: spec [

	spec
		baseline: 'Pillar'
		with: [ spec repository: 'github://pillar-markup/pillar:dev-8/src' ]
]

{ #category : #dependencies }
BaselineOfUSTools >> qcmagritte: spec [

	spec
		baseline: 'QCMagritte'
		with: [ spec repository: 'github://udoschneider/QCMagritte/src' ]
]

{ #category : #dependencies }
BaselineOfUSTools >> renoirSt: spec [

	spec baseline: 'RenoirSt' with: [ 
		spec repository:
			'github://udoschneider/RenoirSt:release-candidate/source' ]
]

{ #category : #dependencies }
BaselineOfUSTools >> seaside: spec [

	spec
		baseline: 'Seaside3'
		with: [ 
		spec repository: 'github://SeasideSt/Seaside:master/repository' ]
]
