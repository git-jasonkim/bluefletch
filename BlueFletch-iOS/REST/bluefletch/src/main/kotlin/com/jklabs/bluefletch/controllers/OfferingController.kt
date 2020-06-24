package com.jklabs.bluefletch.controllers

import com.jklabs.bluefletch.models.OfferingModel
import org.springframework.web.bind.annotation.GetMapping
import org.springframework.web.bind.annotation.RestController

@RestController
class OfferingController() {

  @GetMapping("/offerings")
  fun offeringData(): List<OfferingModel> {
    return listOf(
            OfferingModel("BlueFletch_LegacyMigration", "Migrate from legacy to modern", "Update apps and devices without disrupting business operations."),
            OfferingModel("BlueFletch_CustomApps", "Develop custom apps", "Create Android, iOS, and Web apps that overcome challenges and drive business value."),
            OfferingModel("BlueFletch_POC", "Build proof of concepts", "Quickly validate enterprise mobile concepts and test assumptions without a large investment."),
            OfferingModel("BlueFletch_EMM", "Implement a new EMM solution", "Maximize your AirWatch, SOTI, or other EMM system."),
            OfferingModel("BlueFletch_MobileStrategy", "Define a new mobile strategy", "Implement a mobile strategy to reduce operational costs and deliver a higher ROI.")
    )
  }
}