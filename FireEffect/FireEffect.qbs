Application {
	Depends { name: "sdk" }
	files: [ "FireEffect.c" ]

	cpp.defines: [ "EP1" ]
	cpp.optimization: "O2"
	cpp.staticLibraries: ["Lib"]
}