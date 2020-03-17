//
//  ChronometerViewController.swift
//  ICTUSCode
//
//  Created by David Ochoa on 7/16/18.
//  Copyright © 2018 Secretaria de Salud Nuevo Leon. All rights reserved.
//

import UIKit

class ChronometerViewController: UIViewController {
    @IBOutlet weak var stopButton: UIButton!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var chronoLabel: UILabel!
    
    var count = 0
    var timer = Timer()
    
    let brainLevel0 = [UIImage(named: "brain_anim_0")!, UIImage(named: "brain_anim_1")!] // 0 - 30 minutos
    let brainLevel1 = ["brain_anim_0", "brain_anim_2"] // 31 minutos - 1 hora
    let brainLevel2 = ["brain_anim_0", "brain_anim_3"] // 1 hora - 1 hora 30 minutos
    let brainLevel3 = ["brain_anim_0", "brain_anim_4"] // 1 hora 31 minutos - 2 horas
    let brainLevel4 = ["brain_anim_0", "brain_anim_5"] // 2 horas - 2 horas 30 minutos
    let brainLevel5 = ["brain_anim_0", "brain_anim_6"] // 2 horas 31 minutos - 3 horas
    let brainLevel6 = ["brain_anim_0", "brain_anim_7"] // 3 horas - 3 horas 31 minutos
    let brainLevel7 = ["brain_anim_0", "brain_anim_8"] // 3 horas 31 minutos - 4 horas
    let brainLevel8 = ["brain_anim_0", "brain_anim_8"] // + de 4 horas
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.imageView.animationImages = brainLevel0
        self.imageView.animationDuration = 1.0
        self.imageView.startAnimating()
        
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(counter), userInfo: nil, repeats: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func counter(){
        count += 1
        // 9
        if count > 9 {
            
            chronoLabel.text = "\(count)"
            
        }
        else {
            
            chronoLabel.text = "0\(count)"
            
        }
    }
    
    func StopChrono(){
        timer.invalidate()
        chronoLabel.text = "00"
    }
    
}
