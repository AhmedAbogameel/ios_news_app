//
//  NewsCard.swift
//  news_app
//
//  Created by Jemi on 18/11/2021.
//

import UIKit

class NewsCard: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var imageLabel: UIImageView!
    
    func loadImage(imageURL:String) {
        DispatchQueue.global().async {
            do {
                let url = URL(string: imageURL)!
                let data = try Data(contentsOf: url)
                DispatchQueue.main.sync {
                    self.imageLabel.image = UIImage(data: data)
                }
            } catch {
                print("ERROR!")
            }
        }
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
