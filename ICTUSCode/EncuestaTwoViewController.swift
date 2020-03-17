//
//  EncuestaTwoViewController.swift
//  ICTUSCode
//
//  Created by David Ochoa on 7/20/18.
//  Copyright © 2018 Secretaria de Salud Nuevo Leon. All rights reserved.
//

import UIKit


class EncuestaTwoViewController: UIViewController {

    @IBOutlet weak var fumadorSi: UIButton!
    @IBOutlet weak var fumadorNo: UIButton!
    @IBOutlet weak var fumadorIntentoDejarlo: UIButton!
    @IBOutlet weak var anteICTUSNo: UIButton!
    @IBOutlet weak var anteICTUSSi: UIButton!
    @IBOutlet weak var anteICTUSNoSabe: UIButton!
    @IBOutlet weak var buttonSobrepeso: UIButton!
    @IBOutlet weak var buttonColesterolAlto: UIButton!
    @IBOutlet weak var buttonHipertensión: UIButton!
    @IBOutlet weak var diabetesNo: UIButton!
    @IBOutlet weak var diabetesSi: UIButton!
    @IBOutlet weak var diabetesPrediabetes: UIButton!
    @IBOutlet weak var ejercicioNunca: UIButton!
    @IBOutlet weak var ejercicio12veces: UIButton!
    @IBOutlet weak var ejercicio3masveces: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
