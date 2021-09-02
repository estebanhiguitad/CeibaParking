//
//  MotorcyclePresentationTranslator.swift
//  Presentation
//
//  Created by Jeison Andrey Carreño Sánchez - Ceiba Software on 31/08/21.
//

import Foundation
import Domain

class MotorcyclePresentationTranslator: VehiclePresentationTranslator {
    
    override func fromDomainToPresentationEntity(vehicle: Vehicle) -> VehicleEntity{
        let motorcycle = vehicle as! Motorcycle
        
        let vehicleEntityicle: VehicleEntity = VehicleEntity(
            licencePlate: motorcycle.getLicencePlate(),
            admitionDate: motorcycle.getAdmitionDate(),
            typeVehicle: TypeVehicleEnum(rawValue: motorcycle.getTypeVehicle())!,
            cylinderCapacity: motorcycle.getCylinderCapacity(),
            total: motorcycle.calculateTotal()
        )
        
        return vehicleEntityicle
        
    }

    override func fromPresentationEntityToDomainModel(vehicleEntity: VehicleEntity) throws -> Motorcycle{
        var vehicle: Motorcycle!

        do {
            vehicle = try Motorcycle(
                licencePlate: vehicleEntity.licencePlate,
                admitionDate: vehicleEntity.admitionDate,
                typeVehicle: vehicleEntity.typeVehicle.rawValue,
                cylinderCapacity: vehicleEntity.cylinderCapacity ?? 0
            )
        } catch  {
          throw error
        }
        
        return vehicle
    }
}

