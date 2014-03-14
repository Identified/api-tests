package com.identified.transmission.resources

import javax.ws.rs._
import scala.Array
import com.yammer.metrics.annotation.Timed

case class Model1(str: String)
case class Model2(string: String)

@Path("/")
@Produces(Array(core.MediaType.APPLICATION_JSON))
@Consumes(Array(core.MediaType.APPLICATION_JSON))
class ApiResource() {

  @GET
  @Timed
  @Path("hello")
  def proxyGet(@PathParam("url") url: String) : String = {
    "hello world"
  }


  @POST
  @Timed
  @Path("v1/json")
  def json1(@PathParam("url") url: String, body: Model1) : Model1 = {
    Model1(str = body.str.toUpperCase)
  }

  @POST
  @Timed
  @Path("v2/json")
  def json2(@PathParam("url") url: String, body: Model2) : Model2 = {
    Thread.sleep(50)
    Model2(string = body.string.toUpperCase)
  }
}
