//
//  AlertType.swift
//  Stations
//
//  Created by Hasan Aygünoglu on 24.04.2023.
//
import UIKit

enum AlertType {
  case success, failure
  
  var backgroundColor: UIColor {
    switch self {
    case .success:
      return UIColor(red: 0/255, green: 171/255, blue: 102/255, alpha: 1)
    case .failure:
      return UIColor(red: 204/255, green: 0/255, blue: 0/255, alpha: 1)
    }
  }
  
  var titleText: String {
    switch self {
    case .success:
      return "Success"
    case .failure:
      return "Error!"
    }
  }
  
  var buttonText: String {
    switch self {
    case .success:
      return "Continue"
    case .failure:
      return "Try again"
    }
  }
}
