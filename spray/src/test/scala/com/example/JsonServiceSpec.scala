package com.example

import org.specs2.mutable.Specification
import spray.testkit.Specs2RouteTest
import spray.http._
import StatusCodes._

class JsonServiceSpec extends Specification with Specs2RouteTest with JsonService {
  def actorRefFactory = system

  "JsonService" should {

    "return something for POST requests to the v1/json path" in {
      Post("/v1/json") ~> jsonRoute ~> check {
        responseAs[String] must contain("something")
      }
    }

    "return something for POST requests to the v2/json path" in {
      Post("/v2/json") ~> jsonRoute ~> check {
        responseAs[String] must contain("something")
      }
    }
  }
}
