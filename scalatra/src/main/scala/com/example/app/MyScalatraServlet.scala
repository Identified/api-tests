package com.example.app

import org.scalatra._
import scalate.ScalateSupport
import scala.util.parsing.json
import main.scala.com.example.app.JsonUtil

case class Payload(str: String)
case class Payload2(string: String)

class MyScalatraServlet extends ScalatraStack {

  get("/") {
    <html>
      <body>
        <h1>Hello, world!</h1>
        Say <a href="hello-scalate">hello to Scalate</a>.
      </body>
    </html>
  }


  get("/hello") {
    "hello world"
  }

  post("/v1/json") {
    val in = JsonUtil.fromJson[Payload](request.body)
    val out = Payload(in.str.toUpperCase)
    JsonUtil.toJson(out)
  }

  post("/v2/json") {
    val in = JsonUtil.fromJson[Payload2](request.body)
    val out = Payload2(in.string.toUpperCase)
    Thread.sleep(50)
    JsonUtil.toJson(out)
  }

}
