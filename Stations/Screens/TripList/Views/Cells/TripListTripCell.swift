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
    // Initialization code
    bookingButton.layer.cornerRadius = 16
  }
  
  @IBAction func bookingTapped(_ sender: UIButton) {
  }
  
}
