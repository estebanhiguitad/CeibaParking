//
//  CarPresentationTranslator.swift
//  Presentation
//
//  Created by Jeison Andrey Carreño Sánchez - Ceiba Software on 1/09/21.
//

import Foundation
import Domain

class CarPresentationTranslator: VehiclePresentationTranslator {
    
    override func fromDomainToPresentationEntity(vehicle: Vehicle) -> VehicleEntity{
        let car = vehicle as! Car
        let vehicleEntityicle: VehicleEntity = VehicleEntity(
            licencePlate: car.getLicencePlate(),
            admitionDate: car.getAdmitionDate(),
            typeVehicle: TypeVehicleEnum(rawValue: car.getTypeVehicle())!,
            total: car.calculateTotal()
        )
        
        return vehicleEntityicle
        
    }

    override func fromPresentationEntityToDomainModel(vehicleEntity: VehicleEntity) throws -> Car{
        var vehicle: Car!
        
        do {
            vehicle = try Car(
                licencePlate: vehicleEntity.licencePlate,
                admitionDate: vehicleEntity.admitionDate,
                typeVehicle: vehicleEntity.typeVehicle.rawValue
            )
        } catch  {
            
          throw error
            
        }
        
        return vehicle
    }
}

