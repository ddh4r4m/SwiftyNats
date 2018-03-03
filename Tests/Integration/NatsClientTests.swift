//
//  NatsClientTests.swift
//  SwiftyNatsTests
//
//  Created by Ray Krow on 2/27/18.
//

import XCTest
@testable import SwiftyNats

class NatsSwiftyTests: XCTestCase {
    
    let natsUrl: String = "http://localhost:4222"
    
    override class func setUp() {
        
        let task = Process()
        task.launchPath = "/usr/local/bin/docker"
        task.arguments = [ "run", "-p", "4222:4222", "--rm", "--name", "swifty_nats_test_server", "nats:1.0.4" ]
        task.launch()
        
        sleep(2) // Give time for docker to spin up nats
    
        super.setUp()
    }
    
    override class func tearDown() {
        
        let task = Process()
        task.launchPath = "/usr/local/bin/docker"
        task.arguments = [ "stop", "swifty_nats_test_server" ]
        task.launch()
        
        super.tearDown()
    }
    
    
    func testClientConnection() {
        
        let client = NatsClient(natsUrl)

        try? client.connect()
        XCTAssertTrue(client.state == .connected, "Client did not connect")
        
        client.disconnect()
        XCTAssertTrue(client.state == .disconnected, "Client did not disconnect")
        
    }
    
    func testClientPublish() {
        
        let client = NatsClient(natsUrl)
        
        guard let _ = try? client.connect() else { XCTAssertTrue(false); return }
        
        client.publish("a test message", to: "swift.test")
        
        sleep(2) // Publish happens async, keep the process alive long enough for the message to go out
        
        client.disconnect()
        
    }
    
    func testClientEvents() {
        
        let client = NatsClient(natsUrl)
        
        var hasConnected = false
        client.on(NatsEvent.connected) {
            hasConnected = true
        }
        
        guard let _ = try? client.connect() else { XCTAssertTrue(false); return }
        
        XCTAssertTrue(hasConnected, "Subscriber was not notified of connection")
        
        client.disconnect()
        
    }
    
    func testClientSubscription() {
        
        let client = NatsClient(natsUrl)
        
        guard let _ = try? client.connect() else { XCTAssertTrue(false); return }
        
        let _ = client.subscribe(to: "swift.test") { message in
            // return "response"
        }
        
        sleep(2)
        
        XCTAssertTrue(true, "Subscriber was not notified of connection")
        
        client.disconnect()
        
    }
    
}
