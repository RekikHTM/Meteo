//
//  WeatherItemCell.swift
//  MeteoApp
//
//  Created by Haithem REKIK on 13/03/2023.
//

import UIKit
import SDWebImage

protocol WeatherItemCellDelegate: AnyObject {
    func onClickItemCell(model: WeatherResponse?)
}

class WeatherItemCell: UITableViewCell {
    @IBOutlet weak var lbCityName: UILabel!
    @IBOutlet weak var lbDistrictName: UILabel!
    @IBOutlet weak var lbTempView: UILabel!
    @IBOutlet weak var lbTimeView: UILabel!
    @IBOutlet weak var imgIconWeather: UIImageView!
    
    static let nibName: String = "WeatherItemCell"
    
    weak var delegate: WeatherItemCellDelegate?
    
    var model: WeatherResponse?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func initView(model: WeatherResponse) {
        self.model = model
        self.lbCityName.text =  self.model?.name ?? ""
        self.lbDistrictName.text = self.model?.sys?.country ?? ""
        // todo: fill missing info from weatherModel
        self.lbTempView.text = "\(self.model?.main?.temp ?? 0)° C"
        if let firstWeather = self.model?.weather?.first {
            let imgPath = Constants.pathImgIcon.replacingOccurrences(of: "***", with: firstWeather.icon)
            self.imgIconWeather.sd_setImage(with: URL(string: imgPath),
                                            placeholderImage: UIImage(named: ""),
                                            options: .waitStoreCache) {  _, _, _, _ in
            }
        }
        
        self.contentView.setOnClickListener(target: self, action: #selector(onClickCell))
    }
    
    @objc func onClickCell(_ tap: UITapGestureRecognizer) {
        self.delegate?.onClickItemCell(model: self.model)
    
    }
    
    /*
     get Nib of Cell
     */
    static func nib() -> UINib {
        return UINib(nibName: WeatherItemCell.nibName, bundle: nil)
    }
}
