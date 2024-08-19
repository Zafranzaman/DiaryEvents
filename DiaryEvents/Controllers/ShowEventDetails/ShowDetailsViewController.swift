//
//  ShowDetailsViewController.swift
//  DiaryEvents
//
//  Created by Zafran Mac on 07/10/2023.
//

import UIKit

class ShowDetailsViewController: UIViewController {
    var Data = [DairyInfomation]()
    var chaintitle = ""
    var db = dbmanager()
    @IBOutlet weak var tableview:UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Chain Event Details"
        print(chaintitle)
        Data = db.getAllInfo(ChainTitle:chaintitle)
        print(Data)
        
    }
    
    
}
extension ShowDetailsViewController :UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 290
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! EventDetailsTableViewCell
        let event = Data[indexPath.row]
        
        cell.Title.text = event.Title
        cell.Event.text = event.Events
        cell.Date.text = event.Date
        cell.Time.text = event.Time
        cell.Venue.text = event.Venue
        cell.Description.text = event.Description
        return cell
    }
    
}
