// Ammonite version 1.6.0
// If you want code to be loaded before you run any script, you can place it in ~/.ammonite/predefScript.sc

import coursier.MavenRepository

// Import other maven repositories
interp.repositories() ++= Seq(MavenRepository("https://dl.bintray.com/ovotech/maven"))

// NOTE Compiler plugins imported without `.$plugin` are not loaded
import $plugin.$ivy.`org.spire-math::kind-projector:0.9.8`

// Load Ammonite-Ops and Ammonite-Shell
interp.load.ivy(
  "com.lihaoyi" %
  s"ammonite-shell_${scala.util.Properties.versionNumberString}" %
  ammonite.Constants.version
)

// NOTE Add the following below to Ammonite ops and shell
//
// val shellSession = ammonite.shell.ShellSession()
// import shellSession._
// import ammonite.ops._
// import ammonite.shell._
// ammonite.shell.Configure(interp, repl, wd)
