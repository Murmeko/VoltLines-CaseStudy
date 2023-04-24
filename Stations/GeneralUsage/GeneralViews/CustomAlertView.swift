//
//  CustomAlertView.swift
//  Stations
//
//  Created by Hasan Aygünoglu on 24.04.2023.
//

import UIKit

class CustomAlertView {
  static func showAlert(on superView: UIView, message: String, type: AlertType) {
    let alertView = UIView()
    alertView.translatesAutoresizingMaskIntoConstraints = false
    alertView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width).isActive = true
    alertView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height).isActive = true
    alertView.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.2)
    superView.addSubview(alertView)
    
    let containerView = UIView()
    containerView.translatesAutoresizingMaskIntoConstraints = false
    containerView.widthAnchor.constraint(equalToConstant: 280).isActive = true
    containerView.heightAnchor.constraint(equalToConstant: 175).isActive = true
    containerView.layer.cornerRadius = 10
    containerView.backgroundColor = type.backgroundColor
    alertView.addSubview(containerView)
    
    let titleLabel = UILabel()
    titleLabel.text = type.titleText
    titleLabel.textColor = .white
    titleLabel.font = .systemFont(ofSize: 28, weight: .bold)
    titleLabel.translatesAutoresizingMaskIntoConstraints = false
    containerView.addSubview(titleLabel)
    
    let messageLabel = UILabel()
    messageLabel.text = message
    messageLabel.textColor = .white
    messageLabel.textAlignment = .center
    messageLabel.numberOfLines = 2
    messageLabel.font = .systemFont(ofSize: 16, weight: .semibold)
    messageLabel.translatesAutoresizingMaskIntoConstraints = false
    containerView.addSubview(messageLabel)
    
    let continueButton = UIButton()
    continueButton.backgroundColor = .white
    continueButton.titleLabel?.textAlignment = .center
    continueButton.titleLabel?.font = .systemFont(ofSize: 18, weight: .light)
    continueButton.setTitle(type.buttonText, for: .normal)
    continueButton.setTitleColor(.black, for: .normal)
    continueButton.layer.cornerRadius = 10
    continueButton.widthAnchor.constraint(equalToConstant: 180).isActive = true
    continueButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
    continueButton.addTarget(self, action: #selector(dismissTapped), for: .touchUpInside)
    continueButton.translatesAutoresizingMaskIntoConstraints = false
    containerView.addSubview(continueButton)
    
    alertView.centerXAnchor.constraint(equalTo: superView.centerXAnchor).isActive = true
    alertView.centerYAnchor.constraint(equalTo: superView.centerYAnchor).isActive = true
    containerView.centerXAnchor.constraint(equalTo: alertView.centerXAnchor).isActive = true
    containerView.centerYAnchor.constraint(equalTo: alertView.centerYAnchor).isActive = true
    titleLabel.centerXAnchor.constraint(equalTo: containerView.centerXAnchor).isActive = true
    titleLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 16).isActive = true
    messageLabel.centerXAnchor.constraint(equalTo: containerView.centerXAnchor).isActive = true
    messageLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 12).isActive = true
    messageLabel.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 30).isActive = true
    messageLabel.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: -30).isActive = true
    continueButton.centerXAnchor.constraint(equalTo: containerView.centerXAnchor).isActive = true
    continueButton.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -16).isActive = true
    
  }
  
  @objc private static func dismissTapped(sender: UIView) {
    sender.superview?.superview?.removeFromSuperview()
  }
}
