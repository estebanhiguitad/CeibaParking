//
//  FinalizeVehicleProtocols.swift
//  Presentation
//
//  Created by Jeison Andrey Carreño Sánchez - Ceiba Software on 29/08/21.
//

import Foundation
import Domain

protocol  FinalizeVehicleProtocols {
    
    var vehiclePresentationTranslator: VehiclePresentationTranslator { get set }
    
    func getVehicles() throws -> [VehicleEntity]
    
    func finalizeService(vehicleEntity: VehicleEntity) throws
    
    func getTypeVehicle(vehicle: Vehicle) -> VehicleEntity
    
    func getOptionsVehicles() -> [OptionVehicleEntity]
    
    func getVehicleByPlate(optionVehicleEntity: OptionVehicleEntity, plate: String) -> VehicleEntity?
}
