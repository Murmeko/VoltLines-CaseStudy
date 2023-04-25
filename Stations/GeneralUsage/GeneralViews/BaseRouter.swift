//
//  BaseRouter.swift
//  Stations
//
//  Created by Hasan Aygünoglu on 25.04.2023.
//

import UIKit

class BaseRouter: BaseRouterProtocol {
  var pushViewController: ((_ viewController: UIViewController) -> Void)?
  var presentViewController: ((_ viewController: UIViewController) -> Void)?
  var popViewController: VoidHandler?
  var popToViewController: VoidHandler?
  var dismiss: VoidHandler?
}
