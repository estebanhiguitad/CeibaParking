//
//  FinalizeVehicleProtocols.swift
//  Presentation
//
//  Created by Jeison Andrey Carreño Sánchez - Ceiba Software on 29/08/21.
//

import Foundation
protocol  FinalizeVehicleProtocols {
    
    var vehiclePresentationTranslator: VehiclePresentationTranslator { get set }
    
    func getVehicles() throws -> [VehicleEntity]
    
    func finalizeService(vehicleEntity: VehicleEntity) throws
    
    
}
