package com.mamoot.adsbtransponders.routes

import akka.http.scaladsl.server.Directives._
import akka.http.scaladsl.model.HttpEntity
import akka.http.scaladsl.server.Route
import akka.util.Timeout

import scala.concurrent.duration._

object AirlineRoute {
  def getRoutes(): Route = {
    val routes = path("airlines") {
      implicit val askTimeout: Timeout = 20.seconds
      get {
        complete(HttpEntity("echo"))
      }
    }
    routes
  }
}