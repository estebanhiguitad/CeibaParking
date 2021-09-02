//
//  ViewController.swift
//  Presentation
//
//  Created by Andrés David Santacoloma Isaza - Ceiba Software on 28/10/20.
//

import UIKit
import Domain

class HomeViewController: UIViewController {

    @IBOutlet weak var tabBar: UITabBar!
    @IBOutlet weak var containerView: UIView!
    
    var containerButtons:[(tabItem: UITabBarItem, controller: UIViewController)]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
    }
    
    
    func setUpView(){
        
        inflateContainerButtons()
        tabBar.selectedItem = containerButtons[0].tabItem
        changeViewInContainerView(viewController: containerButtons[0].controller)
    }
    
    func changeViewInContainerView(viewController: UIViewController){
        let subview = viewController.view ?? UIView()
        
        containerView = removeSubviewFromContainerView(parentView: containerView)
        setFrameSubview(subview: subview, parentView: containerView)
        containerView.addSubview(subview)
        
    }
    
    func removeSubviewFromContainerView(parentView: UIView) -> UIView{
        
        return parentView
    }
    
    func setFrameSubview(subview: UIView, parentView: UIView){
        subview.frame = parentView.bounds
        subview.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
    }
    
    func inflateContainerButtons(){
        containerButtons = [
            (
                tabItem: UITabBarItem(title: "Registrar", image:  UIImage(systemName: "square.and.pencil"), tag: 0),
                controller: RegisterVehicleViewController()
            ),
            (
                tabItem: UITabBarItem(title: "Facturar", image:  UIImage(systemName: "doc.text.magnifyingglass"), tag: 1),
                controller: BoucherViewController()
            )
        ]
        setUpTabBar()
    }
    
    func setUpTabBar(){
        tabBar.delegate = self
        tabBar.items? = containerButtons.map({$0.tabItem})
    }
    
}

extension HomeViewController: UITabBarDelegate{

    func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        
        let item = containerButtons[item.tag]
        changeViewInContainerView(viewController: item.controller)
        
    }
    
    
}
