//
//  TripListTripCell.swift
//  Stations
//
//  Created by Hasan Aygünoglu on 25.04.2023.
//

import UIKit

class TripListTripCell: TripListBaseTableViewCell {
  @IBOutlet weak var busLabel: UILabel!
  @IBOutlet weak var busArrival: UILabel!
  @IBOutlet weak var bookingButton: UIButton!
  
  override func awakeFromNib() {
    super.awakeFromNib()
  }
  
  override func configureCell() {
    guard let viewModel = viewModel as? TripListTripCellViewModelProtocol else { return }
    busLabel.text = viewModel.busName
    busArrival.text = viewModel.busArrival
    bookingButton.layer.cornerRadius = 16
  }
  
  @IBAction func bookingTapped(_ sender: UIButton) {
    guard let networkManager = networkManager,
          let viewModel = viewModel as? TripListTripCellViewModelProtocol else { return }
    networkManager.requestBooking(for: viewModel.tripID)
  }
}
