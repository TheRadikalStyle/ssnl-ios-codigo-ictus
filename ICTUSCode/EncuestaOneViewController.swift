//
//  EncuestaOneViewController.swift
//  ICTUSCode
//
//  Created by David Ochoa on 7/19/18.
//  Copyright © 2018 Secretaria de Salud Nuevo Leon. All rights reserved.
//

import UIKit

class EncuestaOneViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var nombreTXF: UITextField!
    @IBOutlet weak var apPatTXF: UITextField!
    @IBOutlet weak var apMatTXF: UITextField!
    @IBOutlet weak var sexChooser: UIPickerView!
    @IBOutlet weak var edadTXF: UITextField!
    @IBOutlet weak var miTelefonoTXF: UITextField!
    @IBOutlet weak var contactoEmergTXF: UITextField!
    @IBOutlet weak var containerEmergNumberView: UIView!
    var pickerData :[String] = [String]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        pickerData = ["-", "Femenino", "Masculino"]
        sexChooser.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //Number of columns
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    //Number of rows
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
    //Data to show
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
    }
    
    //Capture the selection
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        print(pickerData[row])
    }
    

}
