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
    lazy var buttonStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.alignment = .fill
        stackView.spacing = 8.0
        return stackView
    }()
    lazy var clearButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Clear", for: .normal)
        button.setTitleColor(UIColor(red:0.00, green:0.48, blue:1.00, alpha:1.0), for: .normal)
        button.frame = CGRect(x: 100, y: 100, width: 200, height: 40)
        button.layer.cornerRadius = 5
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor(red:0.00, green:0.48, blue:1.00, alpha:1.0).cgColor
        button.addTarget(self, action: #selector(clearButtonPressed), for: .touchUpInside)
        return button
    }()
    lazy var colorButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Colors", for: .normal)
        button.setTitleColor(UIColor(red:0.00, green:0.48, blue:1.00, alpha:1.0), for: .normal)
        button.frame = CGRect(x: 100, y: 100, width: 200, height: 40)
        button.layer.cornerRadius = 5
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor(red:0.00, green:0.48, blue:1.00, alpha:1.0).cgColor
        button.addTarget(self, action: #selector(colorButtonPressed), for: .touchUpInside)
        return button
    }()
    
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
        view.addSubview(buttonStackView)
        view.addSubview(drawingView)
        drawingView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            buttonStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            buttonStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
            buttonStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8),
            drawingView.topAnchor.constraint(equalTo: buttonStackView.bottomAnchor),
            drawingView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            drawingView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            drawingView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
    func setUpButtonLayout(drawingView: UIView, clearButton: UIButton) {
        buttonStackView.addArrangedSubview(clearButton)
        buttonStackView.addArrangedSubview(colorButton)
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

