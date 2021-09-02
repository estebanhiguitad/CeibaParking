//
//  BoucherViewModel.swift
//  Presentation
//
//  Created by Jeison Andrey Carreño Sánchez - Ceiba Software on 29/08/21.
//

import Foundation

protocol BoucherViewModelProtocols: AnyObject {
    func alert(_ text: String)
    func findVehicle(vehicleEntity: VehicleEntity)
    func getPrice(price: Int)
    func getVehiclesOptions(options: [String])
    func getOption(typeName: String)
    func cleanBoucher()
}

class BoucherViewModel{
    
    var finalizeService: FinalizeVehicleService
    private weak var viewDelegate: BoucherViewModelProtocols?
    var vehicles: [VehicleEntity]!
    private var optionsVehicles = [OptionVehicleEntity]()
    private var optioSelected: OptionVehicleEntity!
    
    init(finalizeService: FinalizeVehicleService, viewDelegate: BoucherViewModelProtocols) {
        self.finalizeService = finalizeService
        self.viewDelegate = viewDelegate
        getOptionsVehicles()
    }
    
    func getVehicles(){
        vehicles = try! finalizeService.getVehicles()
    }
    
    func searchVehicle(query: String){
        if let vehicleEntity = finalizeService.getVehicleByPlate(optionVehicleEntity: optioSelected, plate: query){
            viewDelegate!.findVehicle(vehicleEntity: vehicleEntity)
        }
    }
    
    func getOptionsVehicles(){
        optionsVehicles = self.finalizeService.getOptionsVehicles()
        filterOptions()
    }
    
    func finalizeService(vehicleEntity: VehicleEntity){
        do {
            try finalizeService.finalizeService(vehicleEntity: vehicleEntity)
            self.viewDelegate?.alert("Servicio finalizado correctamente")
            self.viewDelegate?.cleanBoucher()
        } catch  {
            self.viewDelegate?.alert(error.decriptionMessage())
        }
        
    }
    
    func filterOptions(){
        let listOptionsNames = optionsVehicles.map({$0.name.rawValue})
        viewDelegate?.getVehiclesOptions(options: listOptionsNames)
    }
    
    
    
    func setOption(index: Int){
        optioSelected = optionsVehicles[index]
        viewDelegate?.getOption(typeName: optioSelected.name.rawValue)
    }
    
}
