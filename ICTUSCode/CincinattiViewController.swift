//
//  CincinattiViewController.swift
//  ICTUSCode
//
//  Created by David Ochoa on 7/11/18.
//  Copyright © 2018 Secretaria de Salud Nuevo Leon. All rights reserved.
//

import UIKit

class CincinattiViewController: UIViewController {

    @IBOutlet weak var viewSonrisa: UIView!
    @IBOutlet weak var viewHablar: UIView!
    @IBOutlet weak var viewBrazos: UIView!
    @IBOutlet weak var nextButton: UIButton!
    
    var sonrisaTapped = false
    var hablarTapped = false
    var brazosTapped = false
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let tapSonrisa = UITapGestureRecognizer(target: self, action: #selector(tapFunction))
        viewSonrisa.isUserInteractionEnabled = true
        viewSonrisa.addGestureRecognizer(tapSonrisa)
        
        let tapHablar = UITapGestureRecognizer(target: self, action: #selector(tapFunction))
        viewHablar.isUserInteractionEnabled = true
        viewHablar.addGestureRecognizer(tapHablar)
        
        let tapBrazos = UITapGestureRecognizer(target: self, action: #selector(tapFunction))
        viewBrazos.isUserInteractionEnabled = true
        viewBrazos.addGestureRecognizer(tapBrazos)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    


@objc func tapFunction(sender :UITapGestureRecognizer) {
    switch sender.view {
        case viewSonrisa:
            if(sonrisaTapped){
                viewSonrisa.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
                sonrisaTapped = false
            }else{
                viewSonrisa.backgroundColor = #colorLiteral(red: 0.9803921569, green: 0.9803921569, blue: 0.9803921569, alpha: 1)
                sonrisaTapped = true
            }
        case viewHablar:
            if(hablarTapped){
                viewHablar.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
                hablarTapped = false
            }else{
                viewHablar.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
                hablarTapped = true
            }
        case viewBrazos:
            if(brazosTapped){
                viewBrazos.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
                brazosTapped = false
            }else{
                viewBrazos.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
                brazosTapped = true
            }
        default:
            print("No view recognizer")
        }
    CheckIfCanPass()
    }
    
    func CheckIfCanPass(){
        if(hablarTapped == true || brazosTapped == true || sonrisaTapped == true){
            nextButton.backgroundColor = #colorLiteral(red: 0.462745098, green: 0.1607843137, blue: 0.4823529412, alpha: 1)
            nextButton.setTitleColor(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), for: UIControlState.normal)
            nextButton.isUserInteractionEnabled = true
        }else{
            nextButton.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            nextButton.setTitleColor(#colorLiteral(red: 0.9333333333, green: 0.9333333333, blue: 0.9333333333, alpha: 1), for: UIControlState.normal)
            nextButton.isUserInteractionEnabled = false
        }
    }

}
