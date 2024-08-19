//
//  MainViewController.swift
//  DiaryEvents
//
//  Created by Zafran Mac on 07/10/2023.
//

import UIKit

class MainViewController: UIViewController {

    // MARK: - Outlets
    @IBOutlet weak var addButton:UIButton!
    @IBOutlet weak var addChainButton:UIButton!
    @IBOutlet weak var showButton:UIButton!
    @IBOutlet weak var showChainButton:UIButton!
    // MARK: - Variables
    
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetup()
        
        
    }
}

// MARK: - Actions
extension MainViewController {
    @IBAction func addEventButtonTapped(_ sender: Any) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyBoard.instantiateViewController(withIdentifier: "AddEventViewController") as! AddEventViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    @IBAction func addChainEventButtonTapped(_ sender: Any) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyBoard.instantiateViewController(withIdentifier: "AddChainViewController") as! AddChainViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    @IBAction func showEventButtonTapped(_ sender: Any) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyBoard.instantiateViewController(withIdentifier: "ShowEventsViewController") as! ShowEventsViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    @IBAction func showChainEventButtonTapped(_ sender: Any) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyBoard.instantiateViewController(withIdentifier: "ShowChainEventViewController") as! ShowChainEventViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

// MARK: - Methods
extension MainViewController {
    func initialSetup(){
        addButton.layer.cornerRadius = 10
        addChainButton.layer.cornerRadius = 10
        showButton.layer.cornerRadius = 10
        showChainButton.layer.cornerRadius = 10
    }
    
}

// MARK: - ViewModel
extension MainViewController {
    
}
