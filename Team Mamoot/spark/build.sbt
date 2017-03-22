name := "adsb-transponders"

version := "0.0.1"

scalaVersion := "2.12.1"

libraryDependencies ++= Seq(
  "org.apache.spark" % "spark-core_2.10" % "2.1.0",
  "org.apache.spark" % "spark-sql_2.10" % "1.0.0",
  "org.apache.spark" % "spark-hive_2.10" % "1.0.0",
  "org.apache.spark" % "spark-mllib_2.10" % "1.0.0",
  "com.typesafe.akka" %% "akka-http" % "10.0.3",
  "com.typesafe.akka" %% "akka-http-spray-json" % "10.0.3"
)

resolvers ++= Seq(
  "Typesafe Repository" at "http://repo.typesafe.com/typesafe/releases/",
  "Java.net Maven2 Repository" at "http://download.java.net/maven/2/",
  Resolver.sonatypeRepo("public")
)

mainClass in (Compile, run) := Some("com.mamoot.adsbtransponders.Startup")

mainClass in (Compile, packageBin) := Some("com.mamoot.adsbtransponders.Startup")