//
//  SaveVehicleeProtocols.swift
//  Presentation
//
//  Created by Jeison Andrey Carreño Sánchez - Ceiba Software on 1/09/21.
//

import Foundation
import DataAccessLocal
import Domain

class AdmitionMotorcycleService: AdmitionVehicleService{
    
    override func saveVehicle(vehicleEntity: VehicleEntity) throws {
        let vehicleRepository = MotorcycleRepositoryRealm()
        var vehicle: Motorcycle
        
        do {
            vehicle = try MotorcyclePresentationTranslator().fromPresentationEntityToDomainModel(vehicleEntity: vehicleEntity)
            try VehicleService(vehicleRepository: vehicleRepository).saveVehicle(vehicle: vehicle)
        } catch {
            throw error
        }
    }
    
}
