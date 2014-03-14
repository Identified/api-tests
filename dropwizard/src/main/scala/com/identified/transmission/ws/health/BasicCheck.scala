package com.identified.transmission.health

import com.yammer.metrics.core.HealthCheck
import com.yammer.metrics.core.HealthCheck.Result

class BasicCheck extends HealthCheck("uptime") {

   override def check() = {
     Result.healthy()
   }
 }
