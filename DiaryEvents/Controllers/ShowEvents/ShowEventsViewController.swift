//
//  ShowEventsViewController.swift
//  DiaryEvents
//
//  Created by Zafran Mac on 07/10/2023.
//

import UIKit

class ShowEventsViewController: UIViewController {
    // MARK: - Outlets
    @IBOutlet weak var tableview:UITableView!
    @IBOutlet weak var currentdate:UITextField!
    @IBOutlet weak var Datepicker: UIDatePicker!
    // MARK: - Variables
    var Data = [DairyInfomation]()
    var db = dbmanager()

    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableview.delegate = self
        tableview.dataSource = self
        Data = db.getAllInfo()
    }
    
}
// MARK: - Actions
extension ShowEventsViewController {
    @IBAction func addEventButtonTapped(_ sender: Any) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyBoard.instantiateViewController(withIdentifier: "AddEventViewController") as! AddEventViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

// MARK: - Methods
extension ShowEventsViewController {
    @IBAction func searchevent(_ sender: Any) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let dateString = dateFormatter.string(from: Datepicker.date)
        Data = db.getAllInfoSearch(search:dateString)
        tableview.reloadData()
        
    }
    @IBAction func allevent(_ sender: Any) {
        Data = db.getAllInfo()
        tableview.reloadData()
        if Data.isEmpty {
            let alert = UIAlertController(title: "Alert!!!", message: "You Don't Add Diary Events🌁", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default))
            self.present(alert, animated: true, completion: nil)
        }
        
    }
    @IBAction func birthdayevent(_ sender: Any) {
        Data = db.getAllInfoForBirthday()
        tableview.reloadData()
        
    }
    @IBAction func Holidayevent(_ sender: Any) {
        Data = db.getAllInfoForPublic()
        tableview.reloadData()
        
    }
    
    @IBAction func todayevent(_ sender: Any) {
        Data = db.getAllInfoForToday()
        tableview.reloadData()
        
    }
    
    
}
extension ShowEventsViewController:UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 290
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ShowEventTableViewCell
        let event = Data[indexPath.row]
        
        cell.Title.text = event.Title
        cell.Event.text = event.Events
        cell.Date.text = event.Date
        cell.Time.text = event.Time
        cell.Venue.text = event.Venue
        cell.Description.text = event.Description
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //let data = tripDataList[indexPath.row]
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyBoard.instantiateViewController(withIdentifier: "AllEventsImagesViewController") as! AllEventsImagesViewController
        vc.eventList = Data
        vc.Index =  indexPath.row
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
