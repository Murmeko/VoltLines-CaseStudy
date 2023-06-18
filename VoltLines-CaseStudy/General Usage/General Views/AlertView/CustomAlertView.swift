//
//  CustomAlertView.swift
//  VoltLines-CaseStudy
//
//  Created by Hasan Aygünoglu on 24.04.2023.
//

import UIKit

class CustomAlertView {
  static func showAlert(on superView: UIView, alert: AlertItem) {
    let alertView = UIView()
    alertView.translatesAutoresizingMaskIntoConstraints = false
    alertView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width).isActive = true
    alertView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height).isActive = true
    alertView.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.3)
    superView.addSubview(alertView)
    
    let containerView = UIView()
    containerView.translatesAutoresizingMaskIntoConstraints = false
    containerView.widthAnchor.constraint(equalToConstant: 280).isActive = true
    containerView.heightAnchor.constraint(equalToConstant: 160).isActive = true
    containerView.layer.cornerRadius = 8
    containerView.backgroundColor = .white
    alertView.addSubview(containerView)
    
    let titleLabel = UILabel()
    titleLabel.text = alert.title
    titleLabel.textColor = .black
    titleLabel.font = .systemFont(ofSize: 18, weight: .bold)
    titleLabel.translatesAutoresizingMaskIntoConstraints = false
    containerView.addSubview(titleLabel)
    
    let messageLabel = UILabel()
    messageLabel.text = alert.message
    messageLabel.textColor = .black
    messageLabel.textAlignment = .center
    messageLabel.numberOfLines = 2
    messageLabel.font = .systemFont(ofSize: 16, weight: .regular)
    messageLabel.translatesAutoresizingMaskIntoConstraints = false
    containerView.addSubview(messageLabel)
    
    let continueButton = UIButton()
    continueButton.backgroundColor = UIColor(red: 22/255, green: 36/255, blue: 171/255, alpha: 1)
    continueButton.titleLabel?.textAlignment = .center
    continueButton.titleLabel?.font = .systemFont(ofSize: 16, weight: .regular)
    continueButton.setTitle(alert.buttonTitle, for: .normal)
    continueButton.setTitleColor(.white, for: .normal)
    continueButton.layer.cornerRadius = 20
    continueButton.widthAnchor.constraint(equalToConstant: 240).isActive = true
    continueButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
    continueButton.addTarget(self, action: #selector(dismissTapped), for: .touchUpInside)
    continueButton.translatesAutoresizingMaskIntoConstraints = false
    containerView.addSubview(continueButton)
    
    alertView.centerXAnchor.constraint(equalTo: superView.centerXAnchor).isActive = true
    alertView.centerYAnchor.constraint(equalTo: superView.centerYAnchor).isActive = true
    containerView.centerXAnchor.constraint(equalTo: alertView.centerXAnchor).isActive = true
    containerView.centerYAnchor.constraint(equalTo: alertView.centerYAnchor).isActive = true
    titleLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 16).isActive = true
    titleLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 12).isActive = true
    messageLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 12).isActive = true
    messageLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 12).isActive = true
    continueButton.centerXAnchor.constraint(equalTo: containerView.centerXAnchor).isActive = true
    continueButton.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -16).isActive = true
  }
  
  @objc private static func dismissTapped(sender: UIView) {
    sender.superview?.superview?.removeFromSuperview()
  }
}
