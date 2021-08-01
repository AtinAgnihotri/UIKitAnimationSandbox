//
//  ViewController.swift
//  UIKitAnimationSandbox
//
//  Created by Atin Agnihotri on 31/07/21.
//

import UIKit

class ViewController: UIViewController {
    
    var imageView: UIImageView!
    var currentAnimation = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        addImageView()
        print("App loaded")
    }
    
    func addImageView() {
        imageView = UIImageView(image: UIImage(named: "penguin"))
        imageView.center = CGPoint(x: 512, y: 384)
        view.addSubview(imageView)
    }

    @IBAction func buttonTapped(_ sender: UIButton) {
        sender.isHidden = true
        
//        UIView.animate(withDuration: 1 , delay: 0, options: [], animations: {
        UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 5, options: [], animations: {
            switch self.currentAnimation {
                case 0:
                    self.imageView.transform = CGAffineTransform(scaleX: 2, y: 2)
                    break
                case 1:
                    self.imageView.transform = .identity
                    break
                case 2:
                    self.imageView.transform = CGAffineTransform(translationX: -256, y: -256)
                    break
                case 3:
                    self.imageView.transform = .identity
                    break
                case 4:
                    // Takes the shortest route based on starting value and destination
                    self.imageView.transform = CGAffineTransform(rotationAngle: .pi)
                    break
                case 5:
                    self.imageView.transform = .identity
                    break
                case 6:
                    self.imageView.alpha = 0.1
                    self.imageView.backgroundColor = .green
                    break
                case 7:
                    self.imageView.alpha = 1
                    self.imageView.backgroundColor = .clear
                    break
                default:
                    break
            }
        }) { finished in
            sender.isHidden = false
        }
        
        currentAnimation = currentAnimation > 7 ? 0 : currentAnimation + 1 // Loop around animations
    }
    
}

