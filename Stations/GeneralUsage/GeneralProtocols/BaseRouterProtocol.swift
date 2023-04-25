//
//  BaseRouterProtocol.swift
//  Stations
//
//  Created by Hasan Aygünoglu on 25.04.2023.
//
import UIKit

protocol BaseRouterProtocol {
  var pushViewController: ((_ viewController: UIViewController) -> Void)? { get set }
  var presentViewController: ((_ viewController: UIViewController) -> Void)? { get set }
  var popViewController: VoidHandler? { get set }
  var popToViewController: VoidHandler? { get set }
  var dismiss: VoidHandler? { get set }
}
