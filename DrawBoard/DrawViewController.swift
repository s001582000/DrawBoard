//
//  DrawViewController.swift
//  DrawBoard
//
//  Created by 梁雅軒 on 2017/3/8.
//  Copyright © 2017年 zoaks. All rights reserved.
//

import UIKit
protocol DrawViewControllerDelegate {
    func drawViewControllerfinishDraw(image:UIImage)
}
class DrawViewController: UIViewController {
    var delegate:DrawViewControllerDelegate?
    @IBOutlet weak var imageView: UIImageView!
    var lastPoint : CGPoint!
    var currentPoint : CGPoint!
    var swiped = false
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        swiped = false
        if let touch = touches.first {
            lastPoint = touch.location(in: self.view)
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        swiped = true
        if let touch = touches.first {
            let currentPoint = touch.location(in: view)
            drawLine(from: lastPoint, to: currentPoint)
            lastPoint = currentPoint
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if !swiped {
            drawLine(from: lastPoint, to: lastPoint)
        }
    }
    
    func drawLine(from fromPoint: CGPoint, to toPoint: CGPoint) {
        UIGraphicsBeginImageContextWithOptions(view.bounds.size, false, 0)
        imageView.image?.draw(in: view.bounds)
        
        if let context = UIGraphicsGetCurrentContext(){
            context.move(to: fromPoint)
            context.addLine(to: toPoint)
            
            context.setLineCap(CGLineCap.round)
            context.setLineWidth(5)
            context.setStrokeColor(UIColor.black.cgColor)
            context.setBlendMode(CGBlendMode.normal)
            context.strokePath()
            
            imageView.image = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
        }
    }

    @IBAction func btnOnClick(_ sender: UIButton) {
        delegate?.drawViewControllerfinishDraw(image: imageView.image!)
        self.dismiss(animated: true, completion: nil)
    }
}
