//
//  detailViewController.swift
//  Fetch-Search
//
//  Created by Bahittin on 9.07.2023.
//

import UIKit

class detailViewController: UIViewController {
    @IBOutlet weak var animeLabel: UILabel!
    var anime = ""
    var character = ""
    var quote = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        print(character)
        animeLabel.text = anime
    }
    //detailviewControllerd
     

}
