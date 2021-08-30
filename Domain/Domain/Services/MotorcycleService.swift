//
//  MotorcycleServices.swift
//  Domain
//
//  Created by Jeison Andrey Carreño Sánchez - Ceiba Software on 27/08/21.
//

public class MotorcycleService: VehicleService{
    
    public func saveMotorCycle(vehicle: Motorcycle) throws {
        if self.vehicleRepository.calculateNumberOfMotorcicles() < 10 {
            do {
                try self.saveVehicle(vehicle: vehicle)
            } catch{
                throw error
            }
        }else{
            throw BusinessError.invalidNumberMotorcycles()
        }
    }
    
}
