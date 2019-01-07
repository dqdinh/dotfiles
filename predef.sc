// Ammonite version 1.6.0
// The REPL pre-defined code which lives in ~/.ammonite/predef.sc

repl.prompt() = "λ "

// Configure compiler settings
// NOTE you can refer to `repl.compiler` when interactive in the REPL
// But you should use `interp.configureCompiler` in your scripts/predef
// because `repl.compiler` may be `null` if the script is cached.
// https://ammonite.io/#CompilerFlags
interp.configureCompiler(_.settings.feature.value = true)
interp.configureCompiler(_.settings.deprecation.value = true)
interp.configureCompiler(_.settings.unchecked.value = true)
interp.configureCompiler(_.settings.YpartialUnification.value = true)
