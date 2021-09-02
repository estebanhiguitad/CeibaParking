//
//  OptionVehicleEntity.swift
//  Presentation
//
//  Created by Jeison Andrey Carreño Sánchez - Ceiba Software on 1/09/21.
//

import Foundation
import Domain

struct OptionVehicleEntity {
    var name: TypeVehicleEnum
    var service: VehicleService
    var translator: VehiclePresentationTranslator
}
