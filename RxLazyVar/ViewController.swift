//
//  ViewController.swift
//  RxLazyVar
//
//  Created by 김종권 on 2023/01/12.
//

import UIKit

class ViewController: UIViewController {
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    private let button1: UIButton = {
        let button = UIButton()
        button.setTitle("open VC2", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.setTitleColor(.blue, for: .highlighted)
        button.addTarget(self, action: #selector(tapButton1), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    private let button2: UIButton = {
        let button = UIButton()
        button.setTitle("open VC3", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.setTitleColor(.blue, for: .highlighted)
        button.addTarget(self, action: #selector(tapButton2), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(stackView)
        NSLayoutConstraint.activate([
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
        
        [button1, button2]
            .forEach(stackView.addArrangedSubview(_:))
    }

    @objc private func tapButton1() {
        let vc = VC2()
        present(vc, animated: true)
    }
    @objc private func tapButton2() {
        let vc = VC3()
        present(vc, animated: true)
    }
}

class VC2: UIViewController {
    private lazy var label: () -> UILabel = {
        let label = UILabel()
        label.text = self.text
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }
    
    private let text = "label"
    
    deinit {
        print("DEINIT: VC2")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .gray
        
        let label = label()
        view.addSubview(label)
        NSLayoutConstraint.activate([
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
    }
}

class VC3: UIViewController {
    private lazy var label: UILabel = {
        let label = UILabel()
        label.text = text
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let text = "label"
    
    deinit {
        print("DEINIT: VC3")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .gray
        
        view.addSubview(label)
        NSLayoutConstraint.activate([
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
    }
}
