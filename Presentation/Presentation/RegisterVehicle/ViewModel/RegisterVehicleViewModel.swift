//
//  RegisterVehicleViewModel.swift
//  Presentation
//
//  Created by Jeison Andrey Carreño Sánchez - Ceiba Software on 28/08/21.
//

import Foundation

protocol RegisterVehicleViewModelProtocols {
    func alert(_ text: String)
}
class RegisterVehicleViewModel{
    
    var admitionService: AdmitionVehicleProtocols
    var viewDelegate: RegisterVehicleViewModelProtocols
    
    init(admitionService: AdmitionVehicleProtocols, viewDelegate: RegisterVehicleViewModelProtocols) {
        self.admitionService = admitionService
        self.viewDelegate = viewDelegate
    }
    
    func saveVehicle(vehicle: VehicleEntity){
        
        do {
            try admitionService.saveVehicle(vehicleEntity: vehicle)
        } catch  {
            viewDelegate.alert(error.localizedDescription)
        }
        
        
    }
    
    
}
