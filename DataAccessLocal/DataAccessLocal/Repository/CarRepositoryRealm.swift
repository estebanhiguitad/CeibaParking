//
//  CarRepositoryRealm.swift
//  DataAccessLocal
//
//  Created by Jeison Andrey Carreño Sánchez - Ceiba Software on 1/09/21.
//

import Foundation
import Domain
import RealmSwift

public class CarRepositoryRealm: VehicleRepositoryRealm {
    
    public override func searchVehicleByPlate(query: String) -> Car? {
        if let vehicleEntity = (database.objects(VehicleEntity.self).filter("licencePlate = %@ AND typeVehicle = %@", query, "Carro").first){
            
            return CarTranslator().fromDatabaseEntityToDomainModel(vehicleEntity: vehicleEntity)
        }
        
        return nil
    }
    
}
