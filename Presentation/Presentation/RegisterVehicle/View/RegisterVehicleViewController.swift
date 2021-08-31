//
//  RegisterVehicleViewController.swift
//  Presentation
//
//  Created by Jeison Andrey Carreño Sánchez - Ceiba Software on 25/08/21.
//

import UIKit

class RegisterVehicleViewController: UIViewController {

    @IBOutlet weak var txtCylinder: UITextField!
    @IBOutlet weak var segment: UISegmentedControl!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var txtDate: UITextField!
    @IBOutlet weak var txtNumbers: UITextField!
    @IBOutlet weak var txtLetter: UITextField!
    @IBOutlet weak var txtLicencePlate: UITextField!
    @IBOutlet weak var viewContentPicker: UIView!
    
    var viewModel: RegisterVehicleViewModel?
    var typeVehicle = "Moto"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = RegisterVehicleViewModel(admitionService: AdmitionVehicleService(), viewDelegate: self)
        setUpView()
        // Do any additional setup after loading the view.
    }
    
    func setUpView(){
        txtDate.inputView = viewContentPicker
        txtDate.addTarget(self, action: #selector(showPicker(_:)), for: .editingDidBegin)
      
    }
    
    func saveVehicle(){
        
        let vehicleEntity = VehicleEntity(
            licencePlate: "\(txtLetter.text!)\(txtNumbers.text!)",
            admitionDate: datePicker.date,
            typeVehicle: typeVehicle,
            cylinderCapacity: Int(txtCylinder.text!)
        )
        
        viewModel?.saveVehicle(vehicle: vehicleEntity)
    }

    @objc func dissmissPicker(){
        txtDate.text = "\(datePicker.date)"
    }
    
    @objc func showPicker(_ sender: UIDatePicker){
        resignFirstResponder()
        viewContentPicker.isHidden = false
    }
    
    @IBAction func tapSaveButton(_ sender: Any) {
        saveVehicle()
    }
    
    @IBAction func tapOkPicker(_ sender: Any) {
        txtDate.resignFirstResponder()
        viewContentPicker.isHidden = true
        dissmissPicker()
    }
    
    @IBAction func changeValueSegment(_ sender: Any) {
        switch segment.selectedSegmentIndex {
        case 0:
            
            typeVehicle = "Moto"
            
        default:
            
            typeVehicle = "Carro"
            
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
extension RegisterVehicleViewController: RegisterVehicleViewModelProtocols{
    
    func alert(_ text: String) {
        let alert = UIAlertController(title: "Error", message: text, preferredStyle: .alert)

        alert.addAction(UIAlertAction(title: "Aceptar", style: .default, handler: nil))
       

        self.present(alert, animated: true)
    }
    
    
}
