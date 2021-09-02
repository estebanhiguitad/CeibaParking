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
    @IBOutlet weak var txtDate: UITextField!
    @IBOutlet weak var txtNumbers: UITextField!
    @IBOutlet weak var txtLetter: UITextField!
    
    var datePicker: UIDatePicker!
    var viewModel: RegisterVehicleViewModel?
    var typeVehicle: TypeVehicleEnum = .motorcycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = RegisterVehicleViewModel(admitionService: AdmitionVehicleService(), viewDelegate: self)
        setUpView()
        // Do any additional setup after loading the view.
    }
    
    @objc func behindDoneAction(_ sender: UITextField) {
        self.txtDate.text = formatDate()
    }
    
    func setUpView(){
        setUpDatePicker()
        setUpTextfields()
    }
    
    func setUpDatePicker(){
        datePicker = UIDatePicker(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height))
        datePicker.preferredDatePickerStyle = .wheels
        
    }
    
    func setUpTextfields(){
        txtDate.inputView = datePicker
        txtDate.addTarget(self, action: #selector(behindDoneAction), for: .editingDidEnd)
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
    
    func formatDate() -> String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm"
        let dateString = dateFormatter.string(from: datePicker.date)
    
        return dateString
    }
    
    @IBAction func tapSaveButton(_ sender: Any) {
        saveVehicle()
    }
    
    @IBAction func changeValueSegment(_ sender: Any) {
        switch segment.selectedSegmentIndex {
        case 0:
            txtCylinder.isHidden = false
            typeVehicle = .motorcycle
        default:
            txtCylinder.isHidden = true
            typeVehicle = .car
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
