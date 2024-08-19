//
//  SplashViewController.swift
//  DiaryEvents
//
//  Created by Zafran Mac on 07/10/2023.
//

import UIKit

class SplashViewController: UIViewController {
@IBOutlet weak var startButton:UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        startButton.layer.cornerRadius = 20
    }

    @IBAction func letsStartButtonTapped(_ sender: Any) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyBoard.instantiateViewController(withIdentifier: "StartViewController") as! StartViewController
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true)
//        self.navigationController?.pushViewController(vc, animated: true)
    }
}
