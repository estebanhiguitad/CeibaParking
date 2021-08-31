//
//  VehiclaPresentationTranslator.swift
//  Presentation
//
//  Created by Jeison Andrey Carreño Sánchez - Ceiba Software on 28/08/21.
//

import Foundation
import Domain

class VehiclePresentationTranslator {
    
    func fromDomainToPresentationEntity(vehicle: Vehicle) -> VehicleEntity{
        
        let vehicleEntityicle: VehicleEntity = VehicleEntity(
            licencePlate: vehicle.getLicencePlate(),
            admitionDate: vehicle.getAdmitionDate(),
            typeVehicle: vehicle.getTypeVehicle()
        )
        
        return vehicleEntityicle
        
    }

    func fromPresentationEntityToDomainModel(vehicleEntity: VehicleEntity) throws -> Vehicle{
        
        var vehicle: Vehicle!
        
        do {
            vehicle = try Vehicle(
                licencePlate: vehicleEntity.licencePlate,
                admitionDate: vehicleEntity.admitionDate,
                typeVehicle: vehicleEntity.typeVehicle
            )
        } catch  {
            
          throw error
            
        }
        
        return vehicle
    }
}

