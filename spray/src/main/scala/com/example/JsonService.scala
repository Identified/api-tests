package com.example

import spray.routing._
import spray.http._
import MediaTypes._

// this trait defines our service behavior independently from the service actor
trait JsonService extends HttpService {

  val jsonRoute =
    path(Segment / "json") { pathVersion: String =>
      post {
        respondWithMediaType(`text/html`) { // XML is marshalled to `text/xml` by default, so we simply override here
          complete {"something"}
        }
      }
    }

}