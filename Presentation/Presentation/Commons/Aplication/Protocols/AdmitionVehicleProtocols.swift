//
//  AdmitionVehicleProtocols.swift
//  Presentation
//
//  Created by Jeison Andrey Carreño Sánchez - Ceiba Software on 29/08/21.
//

import Foundation
protocol  AdmitionVehicleProtocols {
    
    var vehiclePresentationTranslator: VehiclePresentationTranslator { get set }
    
    func saveVehicle(vehicleEntity: VehicleEntity) throws
    
}
