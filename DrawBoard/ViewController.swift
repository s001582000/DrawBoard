//
//  ViewController.swift
//  DrawBoard
//
//  Created by 梁雅軒 on 2017/3/7.
//  Copyright © 2017年 zoaks. All rights reserved.
//

import UIKit

class ViewController: UIViewController,DrawViewControllerDelegate {
    
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func btnOnClick(_ sender: UIButton) {
        let controller = DrawViewController()
        controller.delegate = self
        self.present(controller, animated: true, completion: nil)
    }
    
    func drawViewControllerfinishDraw(image: UIImage) {
        imageView.image = image
    }

}

