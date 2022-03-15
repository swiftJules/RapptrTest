//
//  ChatTableViewCell.swift
//  iOSTest
//
//  Copyright © 2020 Rapptr Labs. All rights reserved.

import Alamofire
import UIKit

class ChatTableViewCell: UITableViewCell {
    
    /**
     * =========================================================================================
     * INSTRUCTIONS
     * =========================================================================================
     * 1) Setup cell to match mockup
     *
     * 2) Include user's avatar image
     **/
    
    // MARK: - Outlets
    @IBOutlet weak var header: UILabel!
    @IBOutlet weak var body: UILabel!
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var bubble: UIView!
    
    // MARK: - Lifecycle
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    // MARK: - Public
    func setCellData(message: Message) {
        fetchImage(message: message)
        header.text = message.name
        body.text = message.message
        configureCellAppearance()
    }
    
    func configureCellAppearance() {
        userImage.layer.cornerRadius = 25
        
        header.textColor = UIColor(hex: 0x1B1E1F)
        body.textColor = UIColor(hex: 0x1B1E1F)
        
        bubble.layer.cornerRadius = 8
        bubble.layer.borderWidth = 1
        bubble.layer.borderColor = UIColor(hex: 0xEFEFEF).cgColor
        bubble.layer.opacity = 1.0
    }
    
    func fetchImage(message: Message) {
        guard let url = message.avatar_url else { return }
        AF.request(url).responseData { (response) in
            if response.error == nil {
                print(response.result)
                
                if let data = response.data {
                    self.userImage.image = UIImage(data: data)
                }
            }
        }
    }
}
