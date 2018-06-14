//
//  ViewController.swift
//  DemoProgressCircle
//
//  Created by MacMiniCorei5-26Ghz on 6/14/18.
//  Copyright © 2018 GVN. All rights reserved.
//

import UIKit
import QuartzCore

class ViewController: UIViewController {
    @IBOutlet weak var progessValue: UITextField!
    var progressCircle = CAShapeLayer()
    var listProgessCircle = [CAShapeLayer]()
    var textLabel = UILabel()
    var currentValue = Float()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let circle = UIView()
        let biggerCircle = UIView()
        let biggerCircle2 = UIView()
        let biggerCircle3 = UIView()
        let biggerCircle4 = UIView()
        
        circle.bounds = CGRect(x: 0,y: 0, width: 100, height: 100)
        circle.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        circle.center = CGPoint(x: 200, y: 200)
        circle.layoutIfNeeded()
        
        biggerCircle.bounds = CGRect(x: 0,y: 0, width: 120, height: 120)
        biggerCircle.frame = CGRect(x: 0, y: 0, width: 120, height: 120)
        biggerCircle.center = CGPoint(x: 200, y: 200)
        biggerCircle.layoutIfNeeded()
        
        biggerCircle2.bounds = CGRect(x: 0,y: 0, width: 140, height: 140)
        biggerCircle2.frame = CGRect(x: 0, y: 0, width: 140, height: 140)
        biggerCircle2.center = CGPoint(x: 200, y: 200)
        biggerCircle2.layoutIfNeeded()
        
        biggerCircle3.bounds = CGRect(x: 0,y: 0, width: 160, height: 160)
        biggerCircle3.frame = CGRect(x: 0, y: 0, width: 160, height: 160)
        biggerCircle3.center = CGPoint(x: 200, y: 200)
        biggerCircle3.layoutIfNeeded()
        
        biggerCircle4.bounds = CGRect(x: 0,y: 0, width: 180, height: 180)
        biggerCircle4.frame = CGRect(x: 0, y: 0, width: 180, height: 180)
        biggerCircle4.center = CGPoint(x: 200, y: 200)
        biggerCircle4.layoutIfNeeded()
        
        textLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 50, height: 21))
        textLabel.center = circle.convert(circle.center, to: circle.superview)
        textLabel.text = progessValue.text! + " %"
        textLabel.textAlignment = .center
        
        self.view.addSubview(textLabel)
        self.view.addSubview(circle)
        self.view.addSubview(biggerCircle)
        self.view.addSubview(biggerCircle2)
        self.view.addSubview(biggerCircle3)
        self.view.addSubview(biggerCircle4)
        
        createCircle(view: circle, color: UIColor.green.cgColor, speed: 1.0)
        createCircle(view: biggerCircle, color: UIColor.purple.cgColor, speed: 0.8)
        createCircle(view: biggerCircle2, color: UIColor.red.cgColor, speed: 0.6)
        createCircle(view: biggerCircle3, color: UIColor.brown.cgColor, speed: 0.4)
        createCircle(view: biggerCircle4, color: UIColor.black.cgColor, speed: 0.3)
    }
    
    func createCircle(view: UIView, color: CGColor, speed: Float) {
        let centerPoint = CGPoint (x: view.bounds.width / 2, y: view.bounds.width / 2)
        let circleRadius : CGFloat = view.bounds.width / 2 * 0.83
        
        let circlePath = UIBezierPath(arcCenter: centerPoint,
                                      radius: circleRadius,
                                      startAngle: CGFloat(-0.5 * .pi),
                                      endAngle: CGFloat(1.5 * .pi),
                                      clockwise: true)
        
        progressCircle = CAShapeLayer()
        progressCircle.path = circlePath.cgPath
        progressCircle.strokeColor = color
        progressCircle.fillColor = UIColor.clear.cgColor
        progressCircle.lineWidth = 3
        progressCircle.strokeStart = 0.0
        progressCircle.speed = speed
        listProgessCircle.append(progressCircle)
        view.layer.addSublayer(progressCircle)
    }
    
    @IBAction func to20Percent(_ sender: Any) {
        changeStroke(value: 0.2)
        currentValue = Float(progressCircle.strokeEnd) * 100
        progessValue.text = currentValue.description
        textLabel.text = Int(currentValue).description + " %"
    }
    
    @IBAction func to80Percent(_ sender: Any) {
        changeStroke(value: 0.8)
        currentValue = Float(progressCircle.strokeEnd) * 100
        progessValue.text = currentValue.description
        textLabel.text = Int(currentValue).description + " %"
    }
    
    @IBAction func decrease(_ sender: Any) {
        currentValue = Float(progessValue.text!)!
        currentValue -= 1
        changeStroke(value: CGFloat(currentValue) / 100)
        progessValue.text = currentValue.description
        textLabel.text = Int(currentValue).description + " %"
    }
    
    @IBAction func increase(_ sender: Any) {
        currentValue = Float(progessValue.text!)!
        currentValue += 1
        changeStroke(value: CGFloat(currentValue) / 100)
        progessValue.text = currentValue.description
        textLabel.text = Int(currentValue).description + " %"
    }
    
    @IBAction func oK(_ sender: Any) {
        currentValue = Float(progessValue.text!)!
        changeStroke(value: CGFloat(currentValue) / 100)
        textLabel.text = Int(currentValue).description + " %"
    }
    
    func changeStroke(value: CGFloat) {
        for item in listProgessCircle {
            item.strokeEnd = value
        }
    }
}
