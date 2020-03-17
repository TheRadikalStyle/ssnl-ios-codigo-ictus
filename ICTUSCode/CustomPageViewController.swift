//
//  CustomPageViewController.swift
//  ICTUSCode
//
//  Created by David Ochoa on 7/25/18.
//  Copyright © 2018 Secretaria de Salud Nuevo Leon. All rights reserved.
//

import UIKit

class CustomPageViewController: UIPageViewController {
    private (set) lazy var controller: [UIViewController] = {
        return [self.getEncuestaController(page: 1),
                self.getEncuestaController(page: 2),
                self.getEncuestaController(page: 3)]
    }()
    var count = 0

    override func viewDidLoad() {
        super.viewDidLoad()

        //dataSource = self
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem.init(title: "Siguiente", style: .done, target: self, action: #selector(goNext))
        
        
        if let firstViewController = controller.first{
            count += 1
            setViewControllers([firstViewController], direction: UIPageViewControllerNavigationDirection.forward, animated: true, completion: nil)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @objc func goNext() -> UIViewController{
        print("Next Slide")
        count += 1
        var encuestaString :String?
        if count <= controller.count{
            switch count{
                case 2:
                    encuestaString = "EncuestaTwo"
                case 3:
                    encuestaString = "EncuestaThree"
                default:
                    print("No se puede instanciar controller para encuesta \(count)")
                }
            }
            return UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: encuestaString!)
        }
    
    func getEncuestaController(page :Int) -> UIViewController{
        var encuestaString :String?
        switch page {
        case 1:
            encuestaString = "EncuestaOne"
        case 2:
            encuestaString = "EncuestaTwo"
        case 3:
            encuestaString = "EncuestaThree"
        default:
            print("No se puede instanciar controller para encuesta \(page)")
        }
        return UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: encuestaString!)
    }
}

/*extension CustomPageViewController: UIPageViewControllerDataSource{
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        guard let viewControllerIndex = controller.index(of: viewController) else {
            return nil
        }
        
        let previousIndex = viewControllerIndex - 1
        
        guard previousIndex >= 0 else {
            return nil
        }
        
        guard controller.count > previousIndex else {
            return nil
        }
        
        return controller[previousIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        guard let viewControllerIndex = controller.index(of: viewController) else {
            return nil
        }
        
        let nextIndex = viewControllerIndex + 1
        let orderedViewControllersCount = controller.count
        
        guard orderedViewControllersCount != nextIndex else {
            return nil
        }
        
        guard orderedViewControllersCount > nextIndex else {
            return nil
        }
        
        return controller[nextIndex]
    }
    
    
}*/
