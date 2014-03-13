package com.example

import org.specs2.mutable.Specification
import spray.testkit.Specs2RouteTest
import spray.http._
import StatusCodes._

class HelloServiceSpec extends Specification with Specs2RouteTest with HelloService {
  def actorRefFactory = system
  
  "HelloService" should {

    "return a greeting for GET requests to the hello path" in {
      Get("/hello") ~> helloRoute ~> check {
        responseAs[String] must contain("hello world")
      }
    }

    "leave GET requests to other paths unhandled" in {
      Get("/kermit") ~> helloRoute ~> check {
        handled must beFalse
      }
    }

  }
}
