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
        if let imageURL = message.avatar_url {
            fetchImage(url: imageURL)
        }
        header.text = message.name
        body.text = message.message
        configureCellAppearance()
    }
    
    func configureCellAppearance() {
        userImage.layer.cornerRadius = 25
        backgroundColor = ColorConstant.viewBackground

        header.textColor = ColorConstant.chatText
        body.textColor = ColorConstant.chatText
        
        bubble.layer.cornerRadius = 8
        bubble.layer.borderWidth = 1
        bubble.layer.borderColor = ColorConstant.chatBorder.cgColor
        bubble.layer.opacity = 1.0
    }
    
    func fetchImage(url: URL) {
        AF.request(url).responseData { (response) in
            if response.error == nil {                
                if let data = response.data {
                    self.userImage.image = UIImage(data: data)
                }
            }
        }
    }
}
