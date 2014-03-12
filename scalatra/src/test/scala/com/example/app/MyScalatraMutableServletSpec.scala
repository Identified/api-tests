package test.scala.com.example.app

import com.example.app.MyScalatraServlet
import org.scalatra.test.specs2._

class MyScalatraMutableServletSpec extends MutableScalatraSpec {
  addServlet(classOf[MyScalatraServlet], "/*")

  "GET / on MyScalatraServlet" should {
    "return status 200" in {
      get("/") {
        status must_== 200
      }
    }
  }

  "GET /hello on MyScalatraServlet" should {
    "return status 200" in {
      get("/hello") {
        status must_== 200
      }
    }

    "return 'hello world'" in {
      get("/hello") {
        body must =~("hello world")
      }
    }
  }

}
