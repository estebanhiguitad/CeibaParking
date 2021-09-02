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
    @IBOutlet weak var txtTypeVehicle: UITextField!
    @IBOutlet weak var txtLicenceplate: DesignableUITextField!
    
    var picker: UIPickerView!
    
    var viewModel: BoucherViewModel?
    var vehicleEntity: VehicleEntity?
    var options = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = BoucherViewModel(finalizeService: FinalizeVehicleService(), viewDelegate: self)
        viewModel?.getVehicles()
        viewModel?.setOption(index: 0)
        // Do any additional setup after loading the view.
    }
    
    func setTupPicker(){
        picker = UIPickerView()
        picker.delegate = self
        picker.dataSource = self
        picker.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: 300)
        txtTypeVehicle.inputView = picker
        picker.reloadAllComponents()
    }
    
    func setUpBoucher(vehicleEntity: VehicleEntity) {
        lblPlate.text = vehicleEntity.licencePlate
        lblType.text = vehicleEntity.typeVehicle.rawValue
        lblInitialDate.text = "\(vehicleEntity.admitionDate)"
        lblTotal.text = "\(vehicleEntity.total)"
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
    
    func getOption(typeName: String) {
        txtTypeVehicle.text = typeName
    }
    
    func getVehiclesOptions(options: [String]) {
        self.options = options
        setTupPicker()
        
    }
    
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
extension BoucherViewController: UIPickerViewDelegate{
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        viewModel?.setOption(index: row)
        viewModel?.searchVehicle(query: txtLicenceplate.text ?? "")
    }
}
extension BoucherViewController: UIPickerViewDataSource{
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return options.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return options[row]
    }
}
