//
//  ViewController.swift
//  Navigation
//
//  Created by Artem Novichkov on 12.09.2020.
//  Copyright © 2020 Artem Novichkov. All rights reserved.
//

import UIKit
import SnapKit

class FeedViewController: UIViewController {

    var publisher: Publisher?

    let textFieldForCheckWord: CustomTextField = {
        let textFieldForCheckWord = CustomTextField(bgColor: .white, placeHolder: " CustomTextField", sizeOfText: 20)
        textFieldForCheckWord.textColor = .black
        textFieldForCheckWord.layer.borderWidth = 3
        textFieldForCheckWord.layer.borderColor = UIColor.gray.cgColor
        textFieldForCheckWord.layer.cornerRadius = 10
        textFieldForCheckWord.clipsToBounds = true
        textFieldForCheckWord.autocapitalizationType = .none
        textFieldForCheckWord.translatesAutoresizingMaskIntoConstraints = false
        return textFieldForCheckWord
    }()

    lazy var button: CustomButton = {
        let button = CustomButton(titleText: "tap", titleColor: .blue, backgroundColor: .systemPink, tapAction: checkWordAtTap)
        button.setBackgroundImage(#imageLiteral(resourceName: "blue_pixel"), for: .normal)
        button.setTitleColor(.gray, for: .selected)
        button.clipsToBounds = true
        button.layer.cornerRadius = 10
        return button
    }()

    var label: UILabel = {
        let label = UILabel()
        label.text = "Привет"
        label.font = UIFont.systemFont(ofSize: 20)
        label.textColor = .gray
        label.textAlignment = .center
        label.backgroundColor = .white
        label.layer.borderWidth = 3
        label.layer.borderColor = UIColor.gray.cgColor
        label.layer.cornerRadius = 10
        label.clipsToBounds = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    func checkWordAtTap() {
        if textFieldForCheckWord.text != nil && textFieldForCheckWord.text?.count != 0 {
            publisher?.checkWord(word: textFieldForCheckWord.text!)

        }
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name(rawValue: "true"), object: nil)
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name(rawValue: "false"), object: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        NotificationCenter.default.addObserver(self, selector: #selector(trueSelector), name: NSNotification.Name(rawValue: "true") , object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(falseSelector), name: NSNotification.Name(rawValue: "false") , object: nil)

        view.backgroundColor = .black
        view.addSubview(label)
        view.addSubview(textFieldForCheckWord)
        view.addSubview(button)

        label.snp.makeConstraints { label in
            label.top.equalTo(view).inset(200)
            label.height.equalTo(40)
            label.width.equalTo(200)
            label.centerX.equalTo(view)
        }

        textFieldForCheckWord.snp.makeConstraints { textFieldForCheckWord in
            textFieldForCheckWord.top.equalTo(view).inset(260)
            textFieldForCheckWord.height.equalTo(40)
            textFieldForCheckWord.width.equalTo(200)
            textFieldForCheckWord.centerX.equalTo(view)
        }

        button.snp.makeConstraints { button in
            button.top.equalTo(view).inset(320)
            button.height.equalTo(40)
            button.width.equalTo(200)
            button.centerX.equalTo(view)
        }
    }

    @objc func trueSelector() {
        label.textColor = .green
        label.layer.borderColor = UIColor.green.cgColor
    }

    @objc func falseSelector() {
        label.textColor = .red
        label.layer.borderColor = UIColor.red.cgColor
    }
}
