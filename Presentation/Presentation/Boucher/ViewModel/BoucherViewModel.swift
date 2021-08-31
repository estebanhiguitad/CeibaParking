//
//  BoucherViewModel.swift
//  Presentation
//
//  Created by Jeison Andrey Carreño Sánchez - Ceiba Software on 29/08/21.
//

import Foundation
import Foundation

protocol BoucherViewModelProtocols {
    func alert(_ text: String)
    func findVehicle(vehicleEntity: VehicleEntity)
    func getPrice(price: Int)
}
class BoucherViewModel{
    
    var finalizeService: FinalizeVehicleService
    var viewDelegate: BoucherViewModelProtocols
    var vehicles: [VehicleEntity]!
    
    init(finalizeService: FinalizeVehicleService, viewDelegate: BoucherViewModelProtocols) {
        
        self.finalizeService = finalizeService
        self.viewDelegate = viewDelegate
        
    }
    
    func getVehicles(){
        
        vehicles = try! finalizeService.getVehicles()
        
    }
    
    func searchVehicle(query: String){
        
        if let vehicleEntity = vehicles.first(where: {$0.licencePlate == query}){
            
            viewDelegate.findVehicle(vehicleEntity: vehicleEntity)
            
        }
        
    }
    
    func finalizeService(vehicleEntity: VehicleEntity){
        
        try! finalizeService.finalizeService(vehicleEntity: vehicleEntity)
        
    }
    
}
