//
//  VehicleRepository.swift
//  Domain
//
//  Created by Jeison Andrey Carreño Sánchez - Ceiba Software on 26/08/21.
//

public protocol VehicleRepository{
    
    func saveVehicle(vehicle: Vehicle)
    
    func isExistVehicle(vehicle: Vehicle) -> Bool
    
    func getVehicles() -> [Vehicle]
    
    func calculateNumberOfMotorcicles() -> Int
    
    func calculateNumberOfCars() -> Int
    
    func finishService(vehicle: Vehicle)
    
    func searchVehicleByPlate(query: String) -> Vehicle?
    
}
