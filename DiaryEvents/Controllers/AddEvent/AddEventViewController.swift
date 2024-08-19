//
//  AddEventViewController.swift
//  DiaryEvents
//
//  Created by Zafran Mac on 07/10/2023.
//

import UIKit
import DropDown
class AddEventViewController: UIViewController, UITextFieldDelegate {
    var db = dbmanager()
    @IBOutlet weak var txtTitle: UITextField!
    @IBOutlet weak var txtVenue: UITextField!
    @IBOutlet weak var Datepicker: UIDatePicker!
    @IBOutlet weak var TimePicker: UIDatePicker!
    @IBOutlet weak var txtDiscription: UITextField!
    @IBOutlet weak var dropDownLabel: UILabel!
    @IBOutlet weak var dropDownView: UIView!
    var Events = "Other"
    override func viewDidLoad() {
        
        super.viewDidLoad()
        dropdowndata()
        self.title = "Add Diary Events"
        let query = "CREATE TABLE IF NOT EXISTS AddEvent (did INTEGER PRIMARY KEY AUTOINCREMENT,Title TEXT,Venue TEXT,Event TEXT,Date TEXT,Time TEXT,Description TEXT,Repeat TEXT)"
        db.CreateInsertUpdateDelete(query: query)
        txtTitle.delegate = self
        txtVenue.delegate = self
        txtDiscription.delegate = self
        
    }
    
    func dropdowndata() {
        dropDown.dataSource  = array
        dropDown.reloadAllComponents()
        dropDown.anchorView = dropDownView
        //        dropDown.dataSource = ["Rwp","ISB","Karachi"]
        // Top of drop down will be below the anchorView
        dropDown.bottomOffset = CGPoint(x: 0, y:(dropDown.anchorView?.plainView.bounds.height)!)
        dropDown.selectionAction = { [unowned self] (index: Int, item: String) in
            
            
            self.Events = item
            self.dropDownLabel.text = item
            print(item)
        }
        dropDown.direction = .any
        dropDownView.layer.borderWidth = 2
        dropDownView.layer.borderColor = UIColor.gray.cgColor
        dropDownView.layer.cornerRadius = 5
        
    }
    
    let dropDown = DropDown()
    var array = ["Birthday","Anniversary","Public Holidays","Others"]
    
    
    @IBAction func dropDownClick(_ sender: Any) {
        dropDown.show()
    }
    
    
    
    
    
    @IBAction func saveButtonPressed(_ sender: UIButton) {
        guard let Title = self.txtTitle.text,
              Title != "",
              let venue = txtVenue.text,
              venue != "",
              let description = txtDiscription.text,
              description != "" else {
            // Display an alert if any of the text fields are empty
            let alert = UIAlertController(title: "Alert!!!", message: "textfield Is empty", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default))
            self.present(alert, animated: true, completion: nil)
            return
        }
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let dateString = dateFormatter.string(from: Datepicker.date)
        
        let timeFormatter = DateFormatter()
        timeFormatter.dateFormat = "HH:mm"
        let timeString = timeFormatter.string(from: TimePicker.date)
        
        let query = "INSERT INTO AddEvent (Title, Venue, Event, Date, Time, Description,Repeat) VALUES ('\(Title)', '\(venue)', '\(Events)', '\(dateString)', '\(timeString)', '\(description)','0')"
        if db.CreateInsertUpdateDelete(query: query){
            let alert = UIAlertController(title: "Alert!!!", message: "Your Event Is Save In Diary!", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default))
            self.present(alert, animated: true, completion: nil)
        }else{
            let alert = UIAlertController(title: "Alert!!!", message: "Unable to Save data", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default))
            self.present(alert, animated: true, completion: nil)
        }
    }
    


// MARK: - Keyboard Handling
   
   // MARK: - UITextFieldDelegate
   
   func textFieldShouldReturn(_ textField: UITextField) -> Bool {
       textField.resignFirstResponder()
       return true
   }
   
   deinit {
       NotificationCenter.default.removeObserver(self)
   }
}
