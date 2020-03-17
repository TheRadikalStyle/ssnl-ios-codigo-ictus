//
//  TimeSymptomViewController.swift
//  ICTUSCode
//
//  Created by David Ochoa on 7/12/18.
//  Copyright © 2018 Secretaria de Salud Nuevo Leon. All rights reserved.
//

import UIKit

class TimeSymptomViewController: UIViewController {

    @IBOutlet weak var labelJustoAhora: UILabel!
    @IBOutlet weak var labelDesdeHace: UILabel!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var nextButton: UIButton!
    

    var justoAhoraTapped = false
    var desdeHaceTapped = false
    var isTimeSelected = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tapJustoAhora = UITapGestureRecognizer(target: self, action: #selector(tapFunction))
        labelJustoAhora.isUserInteractionEnabled = true
        labelJustoAhora.addGestureRecognizer(tapJustoAhora)
        
        let tapDesdeHace = UITapGestureRecognizer(target: self, action: #selector(tapFunction))
        labelDesdeHace.isUserInteractionEnabled = true
        labelDesdeHace.addGestureRecognizer(tapDesdeHace)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func datePickerTimeSelected(_ sender: UIDatePicker) {
        isTimeSelected = true
        CheckIfCanPass()
    }
    
    
    @objc func tapFunction(sender: UITapGestureRecognizer){
        switch sender.view {
            case labelJustoAhora:
                if(desdeHaceTapped){
                    labelDesdeHace.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
                    desdeHaceTapped = false
                    datePicker.isHidden = true
                }
                if(justoAhoraTapped){
                    labelJustoAhora.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
                    justoAhoraTapped = false
                }else{
                    labelJustoAhora.backgroundColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
                    justoAhoraTapped = true
                }
            
            case labelDesdeHace:
                if(justoAhoraTapped){
                    labelJustoAhora.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
                    justoAhoraTapped = false
                }
                if(desdeHaceTapped){
                    labelDesdeHace.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
                    desdeHaceTapped = false
                    datePicker.isHidden = true
                }else{
                    labelDesdeHace.backgroundColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
                    desdeHaceTapped = true
                    datePicker.isHidden = false
                }
            
        default:
            print("No tap recog")
        }
        CheckIfCanPass()
    }
    
    func CheckIfCanPass(){
        if(justoAhoraTapped){
            nextButton.backgroundColor = #colorLiteral(red: 0.462745098, green: 0.1607843137, blue: 0.4823529412, alpha: 1)
            nextButton.setTitleColor(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), for: UIControlState.normal)
            nextButton.isUserInteractionEnabled = true
        }else if(isTimeSelected && desdeHaceTapped){
            nextButton.backgroundColor = #colorLiteral(red: 0.462745098, green: 0.1607843137, blue: 0.4823529412, alpha: 1)
            nextButton.setTitleColor(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), for: UIControlState.normal)
            nextButton.isUserInteractionEnabled = true
        }else if(!isTimeSelected && desdeHaceTapped){
            nextButton.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            nextButton.setTitleColor(#colorLiteral(red: 0.9333333333, green: 0.9333333333, blue: 0.9333333333, alpha: 1), for: UIControlState.normal)
            nextButton.isUserInteractionEnabled = false
        }else{
            nextButton.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            nextButton.setTitleColor(#colorLiteral(red: 0.9333333333, green: 0.9333333333, blue: 0.9333333333, alpha: 1), for: UIControlState.normal)
            nextButton.isUserInteractionEnabled = false
        }
    }
}
