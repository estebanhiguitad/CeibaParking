//
//  MotorCyclaTranslator.swift
//  DataAccessLocal
//
//  Created by Jeison Andrey Carreño Sánchez - Ceiba Software on 31/08/21.
//

import Foundation
import Domain

class MotorCycleTranslator: VehicleTranslator {
    
    override func fromDatabaseEntityToDomainModel(vehicleEntity: VehicleEntity) -> Motorcycle{
        
        let vehicle: Motorcycle = try! Motorcycle(
            licencePlate: vehicleEntity.licencePlate,
            admitionDate: vehicleEntity.admitionDate,
            typeVehicle: vehicleEntity.typeVehicle,
            cylinderCapacity: vehicleEntity.cylinderCapacity
        )
        
        return vehicle
        
    }
    
    override func fromDomainModelToDatabaseEntity(vehicle: Vehicle) -> VehicleEntity{
        
        let vehicleEntity: VehicleEntity = VehicleEntity()
        let motorcycle = vehicle as! Motorcycle
        
        vehicleEntity.licencePlate = motorcycle.getLicencePlate()
        vehicleEntity.admitionDate = motorcycle.getAdmitionDate()
        vehicleEntity.typeVehicle = motorcycle.getTypeVehicle()
        vehicleEntity.cylinderCapacity = motorcycle.getCylinderCapacity() ?? 0
        
        return vehicleEntity
        
    }
}
