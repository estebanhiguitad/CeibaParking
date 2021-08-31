//
//  VehicleRepositoryRealm.swift
//  DataAccessLocal
//
//  Created by Jeison Andrey Carreño Sánchez - Ceiba Software on 26/08/21.
//

import Domain
import RealmSwift

public class VehicleRepositoryRealm: VehicleRepository {
    
    var database : Realm
    
    public init() {
        
        try! database = Realm()
        
    }
    
    public func saveVehicle(vehicle: Vehicle) {
        let vehicleTranslator: VehicleTranslator = VehicleTranslator()
        let vehicleEntity = vehicleTranslator.fromDomainModelToDatabaseEntity(vehicle: vehicle)
        try! database.write {
            database.add(vehicleEntity)
            let vehicleEntities = database.objects(VehicleEntity.self)
            debugPrint(vehicleEntities)
        }
    }
    
    public func isExistVehicle(vehicle: Vehicle) -> Bool {
        
        let vehicleEntities = database.objects(VehicleEntity.self)
        debugPrint(vehicleEntities)
        
        return (database.objects(VehicleEntity.self).filter("licencePlate == \"\(vehicle.getLicencePlate())\"").count > 0)
    }
    
    public func getVehicles() -> [Vehicle] {
        
        let vehicleEntities = database.objects(VehicleEntity.self)
        let vehicleTranslator: VehicleTranslator = VehicleTranslator()
       
        return vehicleEntities.map({vehicleTranslator.fromDatabaseEntityToDomainModel(vehicleEntity: $0)})
        
    }
    
    public func calculatePrice(vehicle: Vehicle) -> String {
        return ""
    }
    
    public func calculateParkingHours(vehicle: Vehicle) -> Int {
        return 0
    }
    
    public func calculateNumberOfMotorcicles() -> Int {
        
        return database.objects(VehicleEntity.self).filter("typeVehicle == \"Moto\"").count
    }
    
    public func calculateNumberOfCars() -> Int {
        
        return database.objects(VehicleEntity.self).filter("typeVehicle == \"Carro\"").count
    }
    
    public func finishService(vehicle: Vehicle) {
        
        if let vehicleEntity = self.getVehicleByPlate(vehicle: vehicle){
            
            try! database.write {
                
                database.delete(vehicleEntity)
                
            }
            
        }
        
    }
    
    
    private func getVehicleByPlate(vehicle: Vehicle) -> VehicleEntity? {
        
        let vehicleEntities = database.objects(VehicleEntity.self)
        debugPrint(vehicleEntities)
        
        return (database.objects(VehicleEntity.self).filter("licencePlate == \"\(vehicle.getLicencePlate())\"").first)
    }
    
}

