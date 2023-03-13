//
//  CityDetailsVC.swift
//  MeteoApp
//
//  Created by Haithem REKIK on 13/03/2023.
//

import UIKit

class CityDetailsVC: UIViewController {
    @IBOutlet weak var lbCityName: UILabel!
    @IBOutlet weak var lbDistrictName: UILabel!
    @IBOutlet weak var lbTempView: UILabel!
    @IBOutlet weak var lbTimeView: UILabel!
    @IBOutlet weak var imgIconWeather: UIImageView!
    @IBOutlet weak var lbHumidityView: UILabel!
    @IBOutlet weak var lbSpeedWindView: UILabel!
    @IBOutlet weak var lbPressureView: UILabel!
    @IBOutlet weak var mBackView: UIView!
    
    var model: WeatherResponse?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.initView()
    }
    
    func initView() {
        self.lbCityName.text = self.model?.name ?? ""
        self.lbDistrictName.text = self.model?.sys?.country ?? ""
        self.lbTempView.text = "\(self.model?.main?.temp ?? 0)° C"
        if let firstWeather = self.model?.weather?.first {
            let imgPath = Constants.pathImgIcon.replacingOccurrences(of: "***", with: firstWeather.icon)
            self.imgIconWeather.sd_setImage(with: URL(string: imgPath),
                                            placeholderImage: UIImage(named: ""),
                                            options: .waitStoreCache) {  _, _, _, _ in
            }
        }
        
        self.lbTimeView.text = self.getCurrenTime()
        let pressureVal = self.model?.main?.pressure ?? 0
        let humidityVal = self.model?.main?.humidity ?? 0
        let speedWindVal = self.model?.wind?.speed ?? 0
        
        self.lbPressureView.text = "Pressure:  \(pressureVal) Bar"
        self.lbHumidityView.text = "Humidity: \(humidityVal)%"
        self.lbSpeedWindView.text = "Wind speed: \(speedWindVal) Km/h"
        self.mBackView.setOnClickListener(target: self, action: #selector(onClickBackButton))
    }
    
    func getCurrenTime() -> String {
        let date = Date()
        let calendar = Calendar.current
        let hour = calendar.component(.hour, from: date)
        let minutes = calendar.component(.minute, from: date)
        return "\(hour):\(minutes)"
    }
    
    @objc func onClickBackButton() {
        self.dismiss(animated: true)
    }
}
