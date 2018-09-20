//
//  ROT_13_CipherTest.swift
//  SpyAppTests
//
//  Created by paul on 9/19/18.
//  Copyright © 2018 Axel Ancona Esselmann. All rights reserved.
//

import XCTest
@testable import SpyApp

class ROT_13_CipherTest: XCTestCase {
    
    var cipher: Cipher!
    
    override func setUp() {
        super.setUp()
        cipher = ROT_13_Cipher()
    }
    
    func test_oneCharacterStirngGetsMappedToSelfWith_0_secret() {
        
        let plaintext = "A"
        let result = cipher.encode(plaintext, secret: "0")
        
        XCTAssertEqual("N", result)
    }
    
    func test_DecodeAndEndcodeWithSpace(){
        
        let plaintext = "I like playing sports"
        let encodeText = cipher.encode(plaintext, secret: "2")
        let result = cipher.decode(encodeText!, secret: "4")
        XCTAssertEqual(plaintext, result)
    }
    
    
    
}
