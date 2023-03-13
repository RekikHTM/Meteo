//
//  HomePageVC.swift
//  MeteoApp
//
//  Created by Haithem REKIK on 13/03/2023.
//

import UIKit

class HomePageVC: UIViewController {

    let viewModel = HomePageVM()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewModel.loadWeather()
        // Do any additional setup after loading the view.
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
