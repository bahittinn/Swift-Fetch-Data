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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
