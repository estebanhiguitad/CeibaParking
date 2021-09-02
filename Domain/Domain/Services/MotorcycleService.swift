//
//  MotorcycleServices.swift
//  Domain
//
//  Created by Jeison Andrey Carreño Sánchez - Ceiba Software on 27/08/21.
//

public class MotorcycleService: VehicleService{
    
    public override func saveVehicle(vehicle: Vehicle) throws {
        if self.vehicleRepository.calculateNumberOfMotorcicles() < 10 {
            self.vehicleRepository.saveVehicle(vehicle: vehicle as! Motorcycle )
        }else{
            throw BusinessError.invalidNumberMotorcycles()
        }
    }
    
    public override func getVehicleByPlate(plate: String) -> Motorcycle?{
        vehicleRepository.searchVehicleByPlate(query: plate) as? Motorcycle
    }
    
}
