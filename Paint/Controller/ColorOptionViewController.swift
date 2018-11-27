//
//  ColorOptionViewController.swift
//  Paint
//
//  Created by Joseph Lee on 11/25/18.
//  Copyright © 2018 Joseph Lee. All rights reserved.
//

import UIKit

class ColorOptionViewController: UIViewController {
    
    var blueButton = UIButton()
    var greenButton = UIButton()
    var brownButton = UIButton()
    var blackButton = UIButton()
    var redButton = UIButton()
    var drawingView: DrawingView
    private var colorStackView = UIStackView()
    
    init(drawingView: DrawingView) {
        self.drawingView = drawingView
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        view.backgroundColor = .white
        view.frame.size = CGSize(width: 200, height: 200)
        setUpButton()
        setUpView()
    }
}

extension ColorOptionViewController {
    func setUpButton() {
        
        //Configure Blue button
        blueButton.setTitle("Blue", for: .normal)
        blueButton.frame = CGRect(x: 100, y: 100, width: 200, height: 40)
        blueButton.layer.cornerRadius = 5
        blueButton.layer.borderWidth = 1
        blueButton.layer.borderColor = UIColor.blue.cgColor
        blueButton.setTitleColor(.blue, for: .normal)
        blueButton.addTarget(self, action: #selector(blueButtonPressed), for: .touchUpInside)
        
        //Configure Green button
        greenButton.setTitle("Green", for: .normal)
        greenButton.frame = CGRect(x: 100, y: 100, width: 200, height: 40)
        greenButton.layer.cornerRadius = 5
        greenButton.layer.borderWidth = 1
        greenButton.layer.borderColor = UIColor.green.cgColor
        greenButton.setTitleColor(.green, for: .normal)
        greenButton.addTarget(self, action: #selector(greenButtonPressed), for: .touchUpInside)
        
        //Configure Brown button
        brownButton.setTitle("Brown", for: .normal)
        brownButton.frame = CGRect(x: 100, y: 100, width: 200, height: 40)
        brownButton.layer.cornerRadius = 5
        brownButton.layer.borderWidth = 1
        brownButton.layer.borderColor = UIColor.brown.cgColor
        brownButton.setTitleColor(.brown, for: .normal)
        brownButton.addTarget(self, action: #selector(brownButtonPressed), for: .touchUpInside)
        
        //Configure Black button
        blackButton.setTitle("Black", for: .normal)
        blackButton.frame = CGRect(x: 100, y: 100, width: 200, height: 40)
        blackButton.layer.cornerRadius = 5
        blackButton.layer.borderWidth = 1
        blackButton.layer.borderColor = UIColor.black.cgColor
        blackButton.setTitleColor(.black, for: .normal)
        blackButton.addTarget(self, action: #selector(blackButtonPressed), for: .touchUpInside)
        
        //Configure Red button
        redButton.setTitle("Red", for: .normal)
        redButton.frame = CGRect(x: 100, y: 100, width: 200, height: 40)
        redButton.layer.cornerRadius = 5
        redButton.layer.borderWidth = 1
        redButton.layer.borderColor = UIColor.red.cgColor
        redButton.setTitleColor(.red, for: .normal)
        redButton.addTarget(self, action: #selector(redButtonPressed), for: .touchUpInside)
        
        setUpButtonLayout()
    }
    
    func setUpButtonLayout() {
        blueButton.translatesAutoresizingMaskIntoConstraints = false
        greenButton.translatesAutoresizingMaskIntoConstraints = false
        brownButton.translatesAutoresizingMaskIntoConstraints = false
        blackButton.translatesAutoresizingMaskIntoConstraints = false
        redButton.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(colorStackView)
        
    }
    
    func setUpView() {
        colorStackView.translatesAutoresizingMaskIntoConstraints = false
        colorStackView.addArrangedSubview(blueButton)
        colorStackView.addArrangedSubview(greenButton)
        colorStackView.addArrangedSubview(brownButton)
        colorStackView.addArrangedSubview(blackButton)
        colorStackView.addArrangedSubview(redButton)
        colorStackView.axis = .vertical
        NSLayoutConstraint.activate([
            colorStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            colorStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
            ])
    }
    
}

extension ColorOptionViewController {
    @objc func blueButtonPressed() {
        drawingView.pathColor = UIColor.blue.cgColor
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc func greenButtonPressed() {
        drawingView.pathColor = UIColor.green.cgColor
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc func brownButtonPressed() {
        drawingView.pathColor = UIColor.brown.cgColor
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc func blackButtonPressed() {
        drawingView.pathColor = UIColor.black.cgColor
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc func redButtonPressed() {
        drawingView.pathColor = UIColor.red.cgColor
        self.dismiss(animated: true, completion: nil)
    }
}

