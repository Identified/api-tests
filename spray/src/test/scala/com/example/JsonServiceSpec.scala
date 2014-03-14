package com.example

import org.specs2.mutable.Specification
import spray.testkit.Specs2RouteTest
import spray.http._
import StatusCodes._
import spray.httpx._

class JsonServiceSpec extends Specification with Specs2RouteTest with JsonService {
  def actorRefFactory = system

  "JsonService" should {

    "return something for POST requests to the v1/json path" in {
      Post("/v1/json",
        HttpEntity(MediaTypes.`application/json`, """{"str":"something"}""")
      ) ~> jsonRoute ~> check {
        responseAs[String] must contain("SOMETHING")
      }
    }

    "return something for POST requests to the v2/json path" in {
      Post("/v2/json",
        HttpEntity(MediaTypes.`application/json`, """{"string":"something"}""")
      ) ~> jsonRoute ~> check {
        responseAs[String] must contain("SOMETHING")
      }
    }
  }
}
