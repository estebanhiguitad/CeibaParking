//
//  BoucherViewController.swift
//  Presentation
//
//  Created by Jeison Andrey Carreño Sánchez - Ceiba Software on 25/08/21.
//

import UIKit

class BoucherViewController: UIViewController {
    
    @IBOutlet weak var lblPlate: UILabel!
    @IBOutlet weak var lblType: UILabel!
    @IBOutlet weak var lblInitialDate: UILabel!
    @IBOutlet weak var lblActualDate: UILabel!
    @IBOutlet weak var lblTotal: UILabel!
    
    var viewModel: BoucherViewModel?
    var vehicleEntity: VehicleEntity?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = BoucherViewModel(finalizeService: FinalizeVehicleService(), viewDelegate: self)
        viewModel?.getVehicles()
        // Do any additional setup after loading the view.
    }

    func setUpBoucher(vehicleEntity: VehicleEntity) {
        
        lblPlate.text = vehicleEntity.licencePlate
        lblType.text = vehicleEntity.typeVehicle
        lblInitialDate.text = "\(vehicleEntity.admitionDate)"
        
    }

    func showPrice(price: Int){
        
        lblTotal.text = "\(price)"
        
    }
    
    @IBAction func changeEdittxtLicencePlate(_ sender: UITextField) {
        
        searchLicencePlate(query: sender.text ?? "")
        
    }
    
    func searchLicencePlate(query: String){
        
        viewModel?.searchVehicle(query: query)
        
    }
    
    @IBAction func tapFinalice(_ sender: Any) {
        
        if let vehicle = vehicleEntity{
            
            viewModel?.finalizeService(vehicleEntity: vehicle)
            resignFirstResponder()
        }
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
extension BoucherViewController: BoucherViewModelProtocols{
    
    func alert(_ text: String) {
        
    }
    
    func findVehicle(vehicleEntity: VehicleEntity) {
        setUpBoucher(vehicleEntity: vehicleEntity)
       
        self.vehicleEntity = vehicleEntity
    }
    
    func getPrice(price: Int) {
        showPrice(price: price)
    }
    
    
}
