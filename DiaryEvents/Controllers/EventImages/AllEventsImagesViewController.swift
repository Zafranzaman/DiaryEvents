//
//  AllEventsImagesViewController.swift
//  DiaryEvents
//
//  Created by Zafran Mac on 21/11/2023.
//

import UIKit

class AllEventsImagesViewController: UIViewController {

    // MARK: - Outlets
    @IBOutlet weak var tripImageView:UIImageView!
    @IBOutlet weak var tableView:UITableView!
    // MARK: - Variables
    var Index = -1
    var eventList = [DairyInfomation]()
    var dbmgr = dbmanager()
    var tripImages: [tripImages] = []
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        fetchData()
        print(Index)
        print(eventList[Index].did)
        self.title = "Trip Images"
        initialSetup()
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(imageViewTapped))
          tripImageView.addGestureRecognizer(tapGesture)
          tripImageView.isUserInteractionEnabled = true
        
      }

      @objc func imageViewTapped() {
          pickImage()
      }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        fetchData()
    }
    func pickImage() {
        tripImageView.image = nil
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .photoLibrary
        imagePicker.delegate = self
        present(imagePicker, animated: true, completion: nil)
    }
    func fetchData() {
        tripImages = dbmgr.getImagesFromDatabase(id: eventList[Index].did)
        tableView.reloadData()
        print(tripImages)
    }
}
extension AllEventsImagesViewController: UIImagePickerControllerDelegate & UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let pickedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            tripImageView.image = pickedImage
        }
        picker.dismiss(animated: true, completion: nil)
    }
}

// MARK: - Actions
extension AllEventsImagesViewController {
    @IBAction func AddImagesButtonTapped(_ sender: Any) {
        guard let image = tripImageView.image,
              let imageData = image.pngData() else {
            print("Failed to convert image to data.")
            return
        }
        let tripid = eventList[Index].did
        if dbmgr.InsertImage(tripid: tripid, imageData: imageData) {
            let alert = UIAlertController(title: "Alert", message: "Your Trip Image is Saved!", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            fetchData()
        } else {
            print("Failed to insert image.")
        }
    }

}

// MARK: - Methods
extension AllEventsImagesViewController {
    func initialSetup(){
        let query = "Create table if not exists AddTripImages (id INTEGER PRIMARY KEY AUTOINCREMENT,Tripid INTEGER,image BLOB)"
        if dbmgr.CreateInsertUpdateDelete(query: query){
            
        }
    }
     
    
}

// MARK: - ViewModel
extension AllEventsImagesViewController {
    
}
extension AllEventsImagesViewController: UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tripImages.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! AllEventsImagesTableViewCell
        let data = tripImages[indexPath.row]
        
        cell.DestinationLabel.text = eventList[Index].Title
        if let image = UIImage(data: data.image) {
            cell.tripimage.image = image
        } else {
            cell.tripimage.image = UIImage(named: "placeholder_image")
        }
        
        return cell
    }

    
    
    
}
