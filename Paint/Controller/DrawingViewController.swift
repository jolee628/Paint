//
//  DrawingViewController.swift
//  Paint
//
//  Created by Joseph Lee on 11/24/18.
//  Copyright © 2018 Joseph Lee. All rights reserved.
//

import UIKit

class DrawingViewController: UIViewController {
    
    var drawingView: DrawingView!
    let clearButton = UIButton()
    let colorButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        drawingView = DrawingView()
        setUpDrawing()
    }
    
    
}

extension DrawingViewController {
    
    func setUpDrawing() {
        drawingView = DrawingView()
        drawingView.backgroundColor = .white
        setUpDrawingLayout(drawingView: drawingView)
        setUpButtonLayout(drawingView: drawingView, clearButton: clearButton)
        
        
    }
    
    func setUpDrawingLayout(drawingView: UIView) {
        view.addSubview(drawingView)
        drawingView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            drawingView.topAnchor.constraint(equalTo: view.topAnchor),
            drawingView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            drawingView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            drawingView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
            ])
    }
    
    func setUpButtonLayout(drawingView: UIView, clearButton: UIButton) {
        
        //Configure the Clear button
        drawingView.addSubview(clearButton)
        clearButton.translatesAutoresizingMaskIntoConstraints = false
        clearButton.setTitle("Clear", for: .normal)
        clearButton.setTitleColor(UIColor(red:0.00, green:0.48, blue:1.00, alpha:1.0), for: .normal)
        clearButton.frame = CGRect(x: 100, y: 100, width: 200, height: 40)
        clearButton.layer.cornerRadius = 5
        clearButton.layer.borderWidth = 1
        clearButton.layer.borderColor = UIColor(red:0.00, green:0.48, blue:1.00, alpha:1.0).cgColor
        clearButton.addTarget(self, action: #selector(clearButtonPressed), for: .touchUpInside)
        
        //Configure the Color button
        drawingView.addSubview(colorButton)
        colorButton.translatesAutoresizingMaskIntoConstraints = false
        colorButton.setTitle("Colors", for: .normal)
        colorButton.setTitleColor(UIColor(red:0.00, green:0.48, blue:1.00, alpha:1.0), for: .normal)
        colorButton.frame = CGRect(x: 100, y: 100, width: 200, height: 40)
        colorButton.layer.cornerRadius = 5
        colorButton.layer.borderWidth = 1
        colorButton.layer.borderColor = UIColor(red:0.00, green:0.48, blue:1.00, alpha:1.0).cgColor
        colorButton.addTarget(self, action: #selector(colorButtonPressed), for: .touchUpInside)

        NSLayoutConstraint.activate([
            clearButton.leadingAnchor.constraint(equalTo: drawingView.leadingAnchor),
            clearButton.topAnchor.constraint(equalTo:  drawingView.safeAreaLayoutGuide.topAnchor),
            colorButton.centerXAnchor.constraint(equalTo: drawingView.centerXAnchor),
            colorButton.topAnchor.constraint(equalTo: drawingView.safeAreaLayoutGuide.topAnchor)
            ])
    }
    
    @objc func clearButtonPressed(sender: UIButton!) {
        drawingView.clear()
    }
    
    @objc func colorButtonPressed(sender: UIButton!) {
        let colorOptionViewController = ColorOptionViewController(drawingView: drawingView)
        colorOptionViewController.providesPresentationContextTransitionStyle = true
        colorOptionViewController.definesPresentationContext = true
        colorOptionViewController.modalPresentationStyle=UIModalPresentationStyle.overCurrentContext
        self.present(colorOptionViewController, animated: true)

    }

}

