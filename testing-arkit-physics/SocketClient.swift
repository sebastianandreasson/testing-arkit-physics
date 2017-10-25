//
//  SocketClient.swift
//  testing-arkit-physics
//
//  Created by Sebastian on 2017-10-25.
//  Copyright © 2017 Sebastian. All rights reserved.
//
/*
 See LICENSE folder for this sample’s licensing information.
 
 Abstract:
 Contains `ThresholdPanGesture` - a custom `UIPanGestureRecognizer` to track a translation threshold for panning.
 */

import ARKit
import SocketIO
import SwiftyJSON

protocol SocketClientDelegate: class {
    func dataReceived(_ text: String)
}

class SocketClient {
    
    private(set) var socket: SocketIOClient
    public var delegate: SocketClientDelegate?
    
    init() {
        socket = SocketIOClient(socketURL: URL(string: "https://3566ad7e.ngrok.io")!, config: [.log(true), .compress])
        
        socket.on(clientEvent: .connect) {data, ack in
            print("socket connected")
        }
        
        socket.on("text") {data, ack in
            if let text = data[0] as? String {
                self.delegate?.dataReceived(text)
            }
        }
        
        socket.connect()
    }
}

