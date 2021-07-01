//
//  WeatherDetailCell.swift
//  Mobiquity_iOS
//
//  Created by Pavan on 27/06/21.
//

import UIKit

class WeatherDetailCell: UITableViewCell {

    @IBOutlet weak var viewContainer: UIView!
    @IBOutlet weak var tempMaxLabel: UILabel!
    @IBOutlet weak var tempMinLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var weatherdescription: UILabel!
    @IBOutlet weak var windvalueLabel: UILabel!
    @IBOutlet weak var cloudOrRainLabel: UILabel!
    @IBOutlet weak var cloudOrRainValueLabel: UILabel!
    @IBOutlet weak var dateDescLabel: UILabel!
    @IBOutlet weak var humidityValue: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        viewContainer.layer.cornerRadius = 12
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
