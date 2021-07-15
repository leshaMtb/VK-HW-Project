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

    let viewModel: FeedViewOutput?

    init(viewModel: FeedViewOutput) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

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

    lazy var buttonForOpenNew: CustomButton = {
        let button = CustomButton(titleText: "OPEN GREEN", titleColor: .blue, backgroundColor: .systemPink, tapAction: openNewVC)
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
        label.textAlignment = .center
        label.backgroundColor = .white
        label.layer.borderWidth = 3
        label.layer.borderColor = UIColor.gray.cgColor
        label.layer.cornerRadius = 10
        label.clipsToBounds = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    //это костыль чтобы разбудить FeedViewModel сразу при открытии, иначе с первого клика по кнопке лэйбл не меняет цвет(вью слой берет его до того,как вьюмодель его даст)
    override func viewWillAppear(_ animated: Bool) {
        viewModel?.check(word: "")
    }

    func checkWordAtTap() {
        if textFieldForCheckWord.text != nil {
            viewModel?.check(word: textFieldForCheckWord.text!)
        }
        label.textColor = viewModel?.color
        label.layer.borderColor = viewModel?.color?.cgColor
    }

    func openNewVC() {
        viewModel?.onTapShowNextModule()
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationController?.navigationBar.isHidden = true
        view.backgroundColor = .black
        view.addSubview(label)
        view.addSubview(textFieldForCheckWord)
        view.addSubview(button)
        view.addSubview(buttonForOpenNew)

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

        buttonForOpenNew.snp.makeConstraints { button in
            button.top.equalTo(view).inset(380)
            button.height.equalTo(40)
            button.width.equalTo(200)
            button.centerX.equalTo(view)
        }
    }
}
