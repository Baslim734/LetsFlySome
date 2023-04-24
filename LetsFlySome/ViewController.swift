//
//  ViewController.swift
//  LetsFlySome
//
//  Created by Никита Бирюков on 20.04.2023.
//

import UIKit

class ViewController: UIViewController {
    
    private let imageView: UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 250, height: 250))
        imageView.image = UIImage(named: "logo")
        return imageView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(imageView)
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        imageView.center = view.center
        DispatchQueue.main.asyncAfter(deadline: .now()+0.5, execute: {
            self.animate()
        })
    }
    
    private func animate() {
        UIView.animate(withDuration: 1, animations: {
            let size = self.view.frame.size.width * 3
            let diffX = size - self.view.frame.size.width
            let diffY = self.view.frame.size.height - size
            
            self.imageView.frame = CGRect(
                x: -(diffX/2),
                y: diffY/2,
                width: size,
                height: size
            )
            
            self.imageView.alpha = 0
        })
        UIView.animate(withDuration: 1.5, animations: {
            self.imageView.alpha = 0
        }, completion: { done in if done {
            DispatchQueue.main.asyncAfter(deadline: .now()+0.3, execute: {
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let authController = storyboard.instantiateViewController(withIdentifier: "AuthViewController") as! AuthViewController
                authController.modalTransitionStyle = .crossDissolve
                authController.modalPresentationStyle = .fullScreen
                self.present(authController, animated: true, completion: nil)
                
            })
        }})
        
        
    }
    
    
}

