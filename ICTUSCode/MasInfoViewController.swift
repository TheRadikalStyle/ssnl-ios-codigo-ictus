//
//  MasInfoViewController.swift
//  ICTUSCode
//
//  Created by David Ochoa on 7/13/18.
//  Copyright © 2018 Secretaria de Salud Nuevo Leon. All rights reserved.
//

import UIKit

class MasInfoViewController: UIViewController {
    @IBOutlet weak var imageSlider: UIImageView!
    @IBOutlet weak var sliderControl: UIPageControl!
    
    var index = 0
    let imagenesInfo = ["masinfo1", "masinfo2", "masinfo3", "masinfo4", "masinfo5", "masinfo6", "masinfo7", "masinfo8", "masinfo9", "masinfo10", "masinfo11", "masinfo12", "masinfo13", "masinfo14", "masinfo15", "masinfo16", "masinfo17", "masinfo18", "masinfo19"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        sliderControl.numberOfPages = imagenesInfo.count
        sliderControl.currentPage = index
        
        imageSlider.isUserInteractionEnabled = true
        let leftSwipe = UISwipeGestureRecognizer(target: self, action: #selector(swipeAction))
        leftSwipe.direction = UISwipeGestureRecognizerDirection.left
        imageSlider.addGestureRecognizer(leftSwipe)
        
        let rightSwipe = UISwipeGestureRecognizer(target: self, action: #selector(swipeAction))
        rightSwipe.direction = UISwipeGestureRecognizerDirection.right
        imageSlider.addGestureRecognizer(rightSwipe)
        
        imageSlider.image = UIImage(named: imagenesInfo[index])
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func swipeAction(sender :UISwipeGestureRecognizer){
        let direction = sender.direction
        switch direction {
        case UISwipeGestureRecognizerDirection.left:
            changeImage(direction: 0)
        case UISwipeGestureRecognizerDirection.right:
            changeImage(direction: 1)
        default:
            print("Gesture not recognized")
        }
    }
    
    
    func changeImage(direction: Int){
        // 0 left - 1 right
        if(direction == 0){
            // on swipe left (arrays are Zero based)
            if index < imagenesInfo.count - 1 {
                index = index + 1
                imageSlider.image = UIImage(named: imagenesInfo[index])
                sliderControl.currentPage = index
            }
        }else if(direction == 1){
            //Right Swipe
            if index > 0 {
                index = index - 1
                imageSlider.image = UIImage(named: imagenesInfo[index])
                sliderControl.currentPage = index
            }
        }
    }

}
