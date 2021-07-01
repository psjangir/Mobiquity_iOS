//
//  HomeViewController.swift
//  Mobiquity_iOS
//
//  Created by Pavan on 27/06/21.
//

import UIKit
import CoreData

class HomeViewController: UIViewController {
    
    @IBOutlet weak var tblData: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    fileprivate var cities: [NSManagedObject] = []
    fileprivate var arrCityList : [NSManagedObject] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tblData.delegate = self
        tblData.dataSource = self
        let nib = UINib(nibName: AppConstants.customTableCellName, bundle: nil)
        tblData.register(nib, forCellReuseIdentifier: AppConstants.customTableCellName)
        self.tblData.estimatedRowHeight = 50
        self.tblData.rowHeight = UITableView.automaticDimension
    }
    
    override func viewWillAppear(_ animated: Bool) {
        fetchRecordsFromCoreData()
        self.tabBarController?.tabBar.isHidden = false
    }
    
    @IBAction func addlocationButtonTapped(_ sender: UIBarButtonItem) {
        let mapVC = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "MapViewController") as? MapViewController
        self.navigationController?.pushViewController(mapVC!, animated: true)
        self.tabBarController?.tabBar.isHidden = true
    }
    
    fileprivate func fetchRecordsFromCoreData() {
        cities = CoreDataHandler.coreDataHandlerObj.fetchAllData()
        arrCityList = cities
        tblData.reloadData()
    }
}

// MARK: - UITableViewDelegates
extension HomeViewController: UITableViewDelegate, UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrCityList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier:AppConstants.customTableCellName) as! CustomTableViewCell
        let filteredCities = arrCityList[indexPath.row]
        cell.mainTitleLabel.text = filteredCities.value(forKeyPath: AppConstants.coreDataCity) as? String
        cell.subTitleLabel.text = filteredCities.value(forKeyPath: AppConstants.coreDatamaindescription) as? String
        cell.temperatureLabel.text = filteredCities.value(forKeyPath: AppConstants.coreDataTemp) as? String
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let weatherDetailsVC = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "WeatherDetailViewController") as? WeatherDetailViewController
        weatherDetailsVC?.lattitude = arrCityList[indexPath.row].value(forKeyPath: AppConstants.coreDataLat) as! String
        weatherDetailsVC?.longitude = arrCityList[indexPath.row].value(forKeyPath: AppConstants.coreDataLong) as! String
        weatherDetailsVC?.cityTemperate = arrCityList[indexPath.row].value(forKeyPath: AppConstants.coreDataTemp) as! String
        
        navigationController?.pushViewController(weatherDetailsVC!, animated: true)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let objectToDelete : NSManagedObject = arrCityList[indexPath.row]
            if (CoreDataHandler.coreDataHandlerObj.deleteRecord(object: objectToDelete))
            {
                arrCityList.remove(at: indexPath.row)
                tableView.deleteRows(at: [indexPath], with: .automatic)
                fetchRecordsFromCoreData()
            }
        }
    }
}

// MARK: - UISearchBarDelegate
extension HomeViewController: UISearchBarDelegate
{
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        arrCityList = cities.filter({
            let name = $0.value(forKey: AppConstants.coreDataCity) as? String
            return name?.range(of: searchBar.text!, options: .caseInsensitive) != nil
        })
        if searchText.isEmpty {
            arrCityList = cities
        }
        tblData.reloadData()
    }
}
