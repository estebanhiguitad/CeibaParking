//
//  MotorcycleRepository.swift
//  DataAccessLocal
//
//  Created by Jeison Andrey Carreño Sánchez - Ceiba Software on 31/08/21.
//

import Domain
import RealmSwift

public class MotorcycleRepositoryRealm: VehicleRepositoryRealm {
    
    public override func saveVehicle(vehicle: Vehicle){
        let motorCycleTranslator: VehicleTranslator = MotorCycleTranslator()
        let vehicleEntity = motorCycleTranslator.fromDomainModelToDatabaseEntity(vehicle: vehicle as! Motorcycle)
        
        try! database.write {
            database.add(vehicleEntity)
            
        }
    }
    
}
