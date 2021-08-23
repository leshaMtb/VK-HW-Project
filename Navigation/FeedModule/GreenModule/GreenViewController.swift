//
//  GreenViewController.swift
//  Navigation
//
//  Created by Apple on 13.07.2021.
//  Copyright © 2021 Artem Novichkov. All rights reserved.
//

import UIKit

class GreenViewController: UIViewController {
    
    lazy var button: UIButton = {
        let button = UIButton()
        button.backgroundColor = .black
        button.setTitle("GO TO ROOT", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(goBack), for: .touchUpInside)
        button.setTitleColor(.gray, for: .selected)
        return button
    }()

    let label: UILabel = {
        let label = UILabel()
        label.backgroundColor = .systemGray4
        label.textColor = .white
        label.textAlignment = .center
        label.layer.cornerRadius = 10
        label.clipsToBounds = true
        label.text = ""
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let secondLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .systemGray4
        label.textColor = .white
        label.textAlignment = .center
        label.layer.cornerRadius = 10
        label.clipsToBounds = true
        label.text = ""
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let viewModel: GreenViewOutout
    
    init(viewModel: GreenViewOutout) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func goBack() {
        viewModel.callFromViewToModel()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.getLabelTextJSONSerialization { (str) in
            DispatchQueue.main.async {
                self.label.text = str
            }
        }
        viewModel.getLabelTextJSONDecoder { (str) in
            DispatchQueue.main.async {
                self.secondLabel.text = str
            }
        }

        navigationController?.navigationBar.isHidden = true
        view.backgroundColor = .green
        view.addSubview(button)
        view.addSubview(label)
        view.addSubview(secondLabel)
        
        NSLayoutConstraint.activate([
            button.widthAnchor.constraint(equalToConstant: 200),
            button.heightAnchor.constraint(equalToConstant: 50),
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor),

            label.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.widthAnchor.constraint(equalToConstant: 200),
            label.heightAnchor.constraint(equalToConstant: 50),

            secondLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 160),
            secondLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            secondLabel.widthAnchor.constraint(equalToConstant: 200),
            secondLabel.heightAnchor.constraint(equalToConstant: 50),
        ])
    }
}


