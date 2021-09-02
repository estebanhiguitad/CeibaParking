//
//  RegisterVehicleViewModel.swift
//  Presentation
//
//  Created by Jeison Andrey Carreño Sánchez - Ceiba Software on 28/08/21.
//

import Foundation
import Domain
protocol RegisterVehicleViewModelProtocols: AnyObject {
    func alert(_ text: String)
}
class RegisterVehicleViewModel{
    
    private var admitionService: AdmitionVehicleProtocols
    private weak var viewDelegate: RegisterVehicleViewModelProtocols?
    
    init(admitionService: AdmitionVehicleProtocols, viewDelegate: RegisterVehicleViewModelProtocols) {
        self.admitionService = admitionService
        self.viewDelegate = viewDelegate
    }
    
    func saveVehicle(vehicle: VehicleEntity){
        changeAdmitionService(typeVehicle: vehicle.typeVehicle)
        do {
            try admitionService.saveVehicle(vehicleEntity: vehicle)
            viewDelegate?.alert("Vehiculo guardado exitosamente")
        } catch  {
            print(error)
            //let newerror = BusinessError.self
            
            viewDelegate!.alert(error.decriptionMessage())
        }
    }
    
    func changeAdmitionService(typeVehicle: TypeVehicleEnum){
        switch typeVehicle {
        case .motorcycle:
            admitionService = AdmitionMotorcycleService()
        case .car:
            admitionService = AdmitionVehicleService()
        }
    }
}
