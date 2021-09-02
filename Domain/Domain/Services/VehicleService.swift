//
//  VehicleTest.swift
//  Domain
//
//  Created by Jeison Andrey Carreño Sánchez - Ceiba Software on 26/08/21.
//

public class VehicleService {
    
    let vehicleRepository: VehicleRepository
    
    public init(vehicleRepository: VehicleRepository) {
        self.vehicleRepository = vehicleRepository
    }
    
    public func getVehicles() -> [Vehicle] {
        return vehicleRepository.getVehicles()
    }
    
    public func saveVehicle(vehicle: Vehicle) throws{
        if vehicleRepository.isExistVehicle(vehicle: vehicle) {
            throw BusinessError.existPlate()
        }
    
        vehicleRepository.saveVehicle(vehicle: vehicle)
    }
    
    public func finishService(vehicle: Vehicle){
        vehicleRepository.finishService(vehicle: vehicle)
    }
    
    public func getVehicleByPlate(plate: String) -> Vehicle?{
        vehicleRepository.searchVehicleByPlate(query: plate)
    }
}
