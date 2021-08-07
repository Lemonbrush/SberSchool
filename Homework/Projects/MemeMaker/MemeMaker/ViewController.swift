//
//  ViewController.swift
//  MemeMaker
//
//  Created by Alexander Rubtsov on 05.08.2021.
//

import UIKit

class ViewController: UIViewController {
    
    let textField: UITextField = {
        let textField = UITextField(frame: .zero)
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.textAlignment = .center
        textField.textColor = .white
        
        let redPlaceholderText = NSAttributedString(string: "Sample Text", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
                
        textField.attributedPlaceholder = redPlaceholderText
        
        textField.font =  UIFont.init(name: "Helvetica Neue", size: 20.0)
        
        return textField
    }()
    
    let saveButton: UIButton = {
        let button = UIButton(frame: .zero)
        button.setImage(UIImage(systemName: "square.and.arrow.up"), for: .normal)
        button.tintColor = .white
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(saveButtonTapped), for: .touchUpInside)
        
        return button
    }()
    
    let backgroundView: UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor = .black
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    let imageView: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.image = UIImage(systemName: "photo.on.rectangle.angled")
        imageView.tintColor = .lightGray
        imageView.backgroundColor = .white
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        
        return imageView
    }()
    
    let imagePickerManager = ImagePickerManager()
    
    //MARK: - LifeCycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView.isUserInteractionEnabled = true
        imageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(imageTapped)))
        
        view.addSubview(backgroundView)
        backgroundView.addSubview(imageView)
        backgroundView.addSubview(textField)
        view.addSubview(saveButton)
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(ViewController.keyboardWillShow(notification:)),
                                               name: UIResponder.keyboardWillShowNotification,
                                               object: nil)
        NotificationCenter.default.addObserver(self,
                                                 selector: #selector(ViewController.keyboardWillHide(notification:)),
                                                 name: UIResponder.keyboardWillHideNotification,
                                                object: nil)
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
        
        setUpConstraints()
    }
    
    //MARK: - Functions
    
    @objc func imageTapped() {
        imagePickerManager.pickImage(self) { image in
            self.imageView.image = image
            self.imageView.contentMode = .scaleAspectFill
        }
    }
    
    @objc func saveButtonTapped() {
        
        textField.selectedTextRange = nil
        
        screenShotMethod()
        
        let alertController: UIAlertController = {
            let controller = UIAlertController(title: "ImageSaved", message: nil, preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .default)
            controller.addAction(action)
            
            return controller
        }()
        
        present(alertController, animated: true)
    }
    
    //MARK: - Helper functions
    
    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            if view.frame.origin.y == 0 {
                self.view.frame.origin.y -= keyboardSize.height
            }
        }
    }

    @objc func keyboardWillHide(notification: NSNotification) {
        if view.frame.origin.y != 0 {
            self.view.frame.origin.y = 0
        }
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    func screenShotMethod() {
        let layer = backgroundView.layer
        let scale = UIScreen.main.scale
        UIGraphicsBeginImageContextWithOptions(layer.frame.size, false, scale);

        layer.render(in: UIGraphicsGetCurrentContext()!)
        let screenshot = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()

        UIImageWriteToSavedPhotosAlbum(screenshot!, nil, nil, nil)
    }
    
    func setUpConstraints() {
        
        // Background
        backgroundView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        backgroundView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        backgroundView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        backgroundView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        
        // ImageView
        imageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 200).isActive = true
        imageView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -200).isActive = true
        imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50).isActive = true
        imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50).isActive = true
        
        // SaveButton
        saveButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 15).isActive = true
        saveButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30).isActive = true
        
        // TextField
        textField.widthAnchor.constraint(equalTo: imageView.widthAnchor).isActive = true
        textField.centerXAnchor.constraint(equalTo: imageView.centerXAnchor).isActive = true
        textField.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 15).isActive = true
    }
}

