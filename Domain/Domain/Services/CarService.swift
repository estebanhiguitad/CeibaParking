//
//  CarService.swift
//  Domain
//
//  Created by Jeison Andrey Carreño Sánchez - Ceiba Software on 27/08/21.
//

public class CarService: VehicleService{
 
    public func saveCar(vehicle: Car) throws {
        if self.vehicleRepository.calculateNumberOfCars() < 20 {
            do {
                try self.saveVehicle(vehicle: vehicle)
            } catch{
                throw error
            }
        }else{
            throw BusinessError.invalidNumberCars()
        }
    }
    
    public override func getVehicleByPlate(plate: String) -> Car?{
        vehicleRepository.searchVehicleByPlate(query: plate) as? Car
    }
}
