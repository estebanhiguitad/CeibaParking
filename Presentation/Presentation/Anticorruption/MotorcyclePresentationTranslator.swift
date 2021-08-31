//
//  MotorcyclePresentationTranslator.swift
//  Presentation
//
//  Created by Jeison Andrey Carreño Sánchez - Ceiba Software on 31/08/21.
//

import Foundation
import Domain

class MotorcyclePresentationTranslator {
    
    func fromDomainToPresentationEntity(vehicle: Motorcycle) -> VehicleEntity{
        
        let vehicleEntityicle: VehicleEntity = VehicleEntity(
            licencePlate: vehicle.getLicencePlate(),
            admitionDate: vehicle.getAdmitionDate(),
            typeVehicle: vehicle.getTypeVehicle(),
            cylinderCapacity: vehicle.getCylinderCapacity()
        )
        
        return vehicleEntityicle
        
    }

    func fromPresentationEntityToDomainModel(vehicleEntity: VehicleEntity) throws -> Motorcycle{
        
        var vehicle: Motorcycle!
        
        do {
            vehicle = try Motorcycle(
                licencePlate: vehicleEntity.licencePlate,
                admitionDate: vehicleEntity.admitionDate,
                typeVehicle: vehicleEntity.typeVehicle,
                cylinderCapacity: vehicleEntity.cylinderCapacity ?? 0
            )
        } catch  {
            
          throw error
            
        }
        
        return vehicle
    }
}

