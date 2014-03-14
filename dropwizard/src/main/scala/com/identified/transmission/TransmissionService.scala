package com.identified.transmission


import com.yammer.dropwizard.ScalaService
import com.yammer.dropwizard.config.{Environment, Bootstrap}
import com.yammer.dropwizard.bundles.ScalaBundle
import com.identified.transmission.resources.ApiResource
import com.identified.transmission.health.BasicCheck
import com.identified.transmission.config.TransmissionConfiguration


object TransmissionService extends ScalaService[TransmissionConfiguration] {
  def initialize(bootstrap: Bootstrap[TransmissionConfiguration]) {
    bootstrap.setName("transmission")
    bootstrap.addBundle(new ScalaBundle)
  }

  def run(config: TransmissionConfiguration, env: Environment) {
    env.addResource(new ApiResource())
    env.addHealthCheck(new BasicCheck())
  }
}