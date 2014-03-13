package com.example

import spray.routing._
import spray.http._
import MediaTypes._
import spray.json._
import spray.httpx.SprayJsonSupport._
import spray.json.DefaultJsonProtocol._


// this trait defines our service behavior independently from the service actor
trait JsonService extends HttpService {

  case class V1Word(str: String)
  case class V2Word(string: String)

  val jsonRoute =
    path(Segment / "json") { (version: String) =>
      post {
        entity(as[Map[String, String]]) { input =>

          respondWithMediaType(`application/json`) {
            var key = version match {
              case "v1" => "str"
              case "v2" =>"string"
            }

            val response = input(key).toUpperCase

            complete{
              JsObject(key -> JsString(response))
            }
          }
        }
      }
    }

}