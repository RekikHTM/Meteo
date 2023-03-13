//
//  SearchCityVC.swift
//  MyForcast
//
//  Created by Haithem Rekik on 04/9/2022.
//

import UIKit

protocol SearchCityVCDelegate: AnyObject {
    func onSelectItemCity(city: WeatherResponse)
}

class SearchCityVC: UIViewController {

    @IBOutlet weak var mTableView: UITableView!
    @IBOutlet weak var mTextFieldSearch: UITextField!
    
    weak var delegate: SearchCityVCDelegate?
    
    let viewModel = SearchCityVM()
    var timer: Timer?
    var searchValue: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.initTableView()
    }
    
    /*
     This function will init tableView
    */
    func initTableView() {
        self.mTableView.register(WeatherItemCell.nib(), forCellReuseIdentifier: WeatherItemCell.nibName)
        self.mTableView.delegate = self
        self.mTableView.dataSource = self
    }

    @IBAction func searchBtnAction(_ sender: Any) {
        self.viewModel.searchForCityByName(value: mTextFieldSearch.text ?? "", completion: {
            DispatchQueue.main.async {
                self.mTableView.reloadData()
            }
        })
    }
}

/*
 This extension will handle tableView's rows
 */
extension SearchCityVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        self.viewModel.getListCitiesItems().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let mCell = tableView.dequeueReusableCell(withIdentifier: WeatherItemCell.nibName, for: indexPath) as? WeatherItemCell {
            mCell.delegate = self
            if let model = self.viewModel.getItemAtIndexOf(index: indexPath.row) {
                mCell.delegate = self
                mCell.initView(model: model)
            }
            return mCell
        }
        return UITableViewCell()
    }
}

/*
 This extension will handle the cell's actions
 */
extension SearchCityVC: WeatherItemCellDelegate {
    func onClickItemCell(model: WeatherResponse?) {
        guard model != nil else {
            return
        }
        print("tessss")
        self.delegate?.onSelectItemCity(city: model!)
        self.dismiss(animated: true)
    }
}
