//
//  BaseViewController.swift
//  Movies
//
//  Created by Naval Hasan on 23/03/24.
//

import Foundation
//import NVActivityIndicatorView
import UIKit

class BaseViewController: UIViewController {
    //#MARK: Declarations
   // var activityIndicator: NVActivityIndicatorView!
    var bgView: UIView = UIView()
    var setCustomHomeNavigation: UIView {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 80, height: 35))
        let logoImage = UIImageView.init(frame: view.frame)
        logoImage.image = #imageLiteral(resourceName: "app_logo_navigation")
        logoImage.contentMode = .scaleAspectFit
        view.addSubview(logoImage);
        logoImage.center.x = view.frame.width/2;
        logoImage.center.y = CGFloat(view.frame.height/2);
        return view
    }
    
    //#MARK: VCLC
    override func viewDidLoad() {
        super.viewDidLoad()
        setupActivityIndicator()
    }
    
    //#MARK: Navigation controller
    func setupHomeNavigation(_ animated: Bool) {
        self.navigationController?.navigationBar.barTintColor = UIColor.white
        navigationController?.setNavigationBarHidden(false, animated: animated)
        self.navigationItem.titleView = setCustomHomeNavigation
        self.navigationController?.navigationBar.barTintColor = ColorValues.navigationBarBackgroundColor
    }
    
    func setupDetailNavigationBar() {
        navigationItem.hidesBackButton = true
        let backButton = UIButton()
        backButton.frame = CGRect(x:0, y:0, width:40, height:40)
        backButton.backgroundColor = UIColor.clear
        let backImage = #imageLiteral(resourceName: "back_button")
        backButton.setImage(backImage, for: .normal)
        backButton.configuration?.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10)
        backButton.addTarget(self, action: #selector(back(sender:)), for: .touchUpInside)
        let leftBarButton = UIBarButtonItem(customView: backButton)
        self.navigationItem.leftBarButtonItem = leftBarButton
        
        let navigationBar = navigationController?.navigationBar
        let navigationBarAppearance = UINavigationBarAppearance()
        navigationBarAppearance.shadowColor = ColorValues.navigationBarBackgroundColor
        navigationBarAppearance.backgroundColor = ColorValues.navigationBarBackgroundColor
        navigationBar?.scrollEdgeAppearance = navigationBarAppearance
    }
    
    @objc func back(sender: UIBarButtonItem) {
        self.navigationController?.popViewController(animated:true)
    }
    
    //#MARK: Activity Indicator
    func setupActivityIndicator() {
        // configure activity indicator using NVActivityIndicatorView
//        let xAxis = (self.view.frame.width / 2) - 27.5
//        let yAxis = self.view.center.y
//        let frame = CGRect(x: xAxis , y: (yAxis - 50), width: 55, height: 55)
//        activityIndicator = NVActivityIndicatorView(frame: frame)
//        activityIndicator.type = . ballSpinFadeLoader
//        activityIndicator.color = UIColor(ColorValues.activityIndicatorColor)
//        activityIndicator.padding = 6
//        activityIndicator.backgroundColor = UIColor(white: 1, alpha: 0.4)
//        activityIndicator.layer.cornerRadius = activityIndicator.frame.height / 2
//        
//        let screenSize: CGRect = UIScreen.main.bounds
//        bgView = UIView(frame: CGRect(x: 0, y: 0, width: screenSize.width, height: screenSize.height))
//        bgView.backgroundColor = .black
//        bgView.alpha = 0.4
//        self.view.addSubview(bgView)
//        self.view.addSubview(activityIndicator)
//        stopLoader()
    }
    
    func startLoader() {
        DispatchQueue.main.async {
            self.bgView.isHidden = false
           // self.activityIndicator.startAnimating()
        }
    }
    
    func stopLoader() {
        DispatchQueue.main.async {
            self.bgView.isHidden = true
           // self.activityIndicator.stopAnimating()
        }
    }
}
