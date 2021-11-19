//
//  DetailsViewController.swift
//  news_app
//
//  Created by Jemi on 19/11/2021.
//

import UIKit

class DetailsViewController: UIViewController {
    
    var newsModel:NewsModel?

    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var imageLabel: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.text = newsModel?.title
        loadImage(url: newsModel!.image)
    }
    
    private func loadImage(url:String) {
        DispatchQueue.global().async {
            do {
                let url = URL(string: url)!
                let data = try Data(contentsOf: url)
                DispatchQueue.main.sync {
                    self.imageLabel.image = UIImage(data: data)
                }
            } catch {
                print("ERROR!")
            }
        }
    }

}
