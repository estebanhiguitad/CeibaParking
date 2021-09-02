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
        let motorCycleTranslator: VehicleTranslator = MotorcycleTranslator()
        let vehicleEntity = motorCycleTranslator.fromDomainModelToDatabaseEntity(vehicle: vehicle as! Motorcycle)
        
        try! database.write {
            database.add(vehicleEntity)
            
        }
    }
    
    public override func searchVehicleByPlate(query: String) -> Motorcycle? {
        if let vehicleEntity = (database.objects(VehicleEntity.self).filter("licencePlate = %@ AND typeVehicle = %@", query, "Moto").first){
            
            return MotorcycleTranslator().fromDatabaseEntityToDomainModel(vehicleEntity: vehicleEntity)
        }
        
        return nil
    }
    
}
