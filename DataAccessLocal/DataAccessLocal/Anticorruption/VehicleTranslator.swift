//
//  VehicleTranslator.swift
//  DataAccessLocal
//
//  Created by Jeison Andrey Carreño Sánchez - Ceiba Software on 26/08/21.
//
import Foundation
import Domain

class VehicleTranslator {
    
    func fromDatabaseEntityToDomainModel(vehicleEntity: VehicleEntity) -> Car{
        
        let vehicle: Car = try! Car(
            licencePlate: vehicleEntity.licencePlate,
            admitionDate: vehicleEntity.admitionDate,
            typeVehicle: vehicleEntity.typeVehicle

        )
        
        return vehicle
        
    }
    
    func fromDomainModelToDatabaseEntity(vehicle: Vehicle) -> VehicleEntity{
        
        let vehicleEntity: VehicleEntity = VehicleEntity()
        
        vehicleEntity.licencePlate = vehicle.getLicencePlate()
        vehicleEntity.admitionDate = vehicle.getAdmitionDate()
        vehicleEntity.typeVehicle = vehicle.getTypeVehicle()

        
        return vehicleEntity
        
    }
}
