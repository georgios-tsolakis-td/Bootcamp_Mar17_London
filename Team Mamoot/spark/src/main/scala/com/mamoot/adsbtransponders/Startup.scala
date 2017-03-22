package main.scala.com.mamoot.adsbtransponders


import akka.actor.ActorSystem
import akka.http.scaladsl.Http
import akka.http.scaladsl.server.Directives._
import akka.stream.ActorMaterializer
import com.mamoot.adsbtransponders.routes.{AircraftTypesRoute, AirlineRoute}
import com.typesafe.config.{Config, ConfigFactory}

import scala.concurrent.ExecutionContext

object Startup extends App {
  implicit val system : ActorSystem  = ActorSystem()
  implicit val materializer : ActorMaterializer = ActorMaterializer()
  implicit val executionContext : ExecutionContext = system.dispatcher
  val config : Config = ConfigFactory.load()
  val routes = AircraftTypesRoute.getRoutes() ~ AirlineRoute.getRoutes()
  val interface = config.getString("http.interface")
  val port = config.getInt("http.port")
  Http() bindAndHandle(routes, interface, port) map { binding =>
    println(s"Running on ${binding.localAddress}")
  }
}
