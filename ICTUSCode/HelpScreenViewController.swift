//
//  HelpScreenViewController.swift
//  ICTUSCode
//
//  Created by David Ochoa on 7/13/18.
//  Copyright © 2018 Secretaria de Salud Nuevo Leon. All rights reserved.
//

import UIKit

class HelpScreenViewController: UIViewController {
    @IBOutlet weak var buttonCall: UIButton!
    @IBOutlet weak var buttonNavigate: UIButton!
    @IBOutlet weak var buttonSendSMS: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func buttonCallPressed(_ sender: Any) {
        if let url = URL(string: "tel://8115652980)"), UIApplication.shared.canOpenURL(url) {
            if #available(iOS 10, *) {
                UIApplication.shared.open(url)
            } else {
                UIApplication.shared.openURL(url)
            }
        }
    }
    @IBAction func buttonNavigatePressed(_ sender: Any) {
    }
    @IBAction func buttonSendSMSPressed(_ sender: Any) {
    }
}
