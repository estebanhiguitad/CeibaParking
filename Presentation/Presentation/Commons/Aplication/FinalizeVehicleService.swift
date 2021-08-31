//
//  FinalizeVehicleService.swift
//  Presentation
//
//  Created by Jeison Andrey Carreño Sánchez - Ceiba Software on 29/08/21.
//

import Foundation
import Domain
import DataAccessLocal

class FinalizeVehicleService: FinalizeVehicleProtocols {
    
    internal var vehiclePresentationTranslator: VehiclePresentationTranslator
    internal var vehicleService: VehicleService
    internal var vehicleRepository: VehicleRepository
    
    init() {
        
        self.vehicleRepository = VehicleRepositoryRealm()
        
        vehiclePresentationTranslator = VehiclePresentationTranslator()
        vehicleService = VehicleService(vehicleRepository: vehicleRepository)
    }
    
    func getVehicles() throws -> [VehicleEntity]{
        
        let vehicles = vehicleService.getVehicles().map({
            vehiclePresentationTranslator.fromDomainToPresentationEntity(vehicle: $0)
        })
        return vehicles
    }
    
    func finalizeService(vehicleEntity: VehicleEntity) throws {
        
        do {
            
            try vehicleService.finishService(vehicle: vehiclePresentationTranslator.fromPresentationEntityToDomainModel(vehicleEntity: vehicleEntity))
            
        } catch {
            
            throw error
            
        }
        
    }
    
    
    
}
