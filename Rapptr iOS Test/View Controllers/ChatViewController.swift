//
//  ChatViewController.swift
//  iOSTest
//
//  Copyright © 2020 Rapptr Labs. All rights reserved.

import Alamofire
import Combine
import UIKit

class ChatViewController: UIViewController, UITableViewDataSource {
    
    /**
     * =========================================================================================
     * INSTRUCTIONS
     * =========================================================================================
     * 1) Make the UI look like it does in the mock-up.
     *
     * 2) Using the following endpoint, fetch chat data
     *    URL: http://dev.rapptrlabs.com/Tests/scripts/chat_log.php
     *
     * 3) Parse the chat data using 'Message' model
     *
     **/
    
    // MARK: - Properties
    var client: ChatClient?
    private var messages = [Message]()
    private var cancellableSet: Set<AnyCancellable> = []

    // MARK: - Outlets
    @IBOutlet weak var chatTable: UITableView!
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchChat()
        configureTable(tableView: chatTable)
        title = "Chat"
    }
    
    // MARK: - Private
    private func configureTable(tableView: UITableView) {
        tableView.dataSource = self
        tableView.backgroundColor = ColorConstant.viewBackground
        tableView.register(UINib(nibName: ChatConstant.chatCell, bundle: nil), forCellReuseIdentifier: ChatConstant.chatCell)
        tableView.separatorStyle = .none
        tableView.tableFooterView = UIView(frame: .zero)
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 100
    }
    
    func fetchChat() {
        let client = ChatClient()
        client.fetchChats()
            .sink { (dataResponse) in
                if dataResponse.error != nil {
                    // handle error
                } else {
                    if let messageList = dataResponse.value?.data {
                        self.messages = messageList
                        self.chatTable.reloadData()
                    }
                }
            }.store(in: &cancellableSet)
    }
        
    // MARK: - UITableViewDataSource
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ChatTableViewCell") as? ChatTableViewCell else { fatalError() }
        cell.setCellData(message: messages[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }
}
