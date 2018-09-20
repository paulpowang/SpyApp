//
//  ROT_5_CipherTest.swift
//  SpyAppTests
//
//  Created by paul on 9/19/18.
//  Copyright © 2018 Axel Ancona Esselmann. All rights reserved.
//

import XCTest
@testable import SpyApp

class ROT_5_CipherTest: XCTestCase {
    
    var cipher: Cipher!
    
    override func setUp() {
        super.setUp()
        cipher = ROT_5_Cipher()
    }
    
    func test_oneCharacterStirngGetsMappedToSelfWith_0_secret() {
        let plaintext = "A"
        
        let result = cipher.encode(plaintext, secret: "0")
        
        XCTAssertEqual("<", result)
    }
    
    func test_InvalidCharactorInput(){
        let result = cipher.encode("$", secret: "2")
        XCTAssertEqual(result, "Error: Input Contains Invalid Charactors")
    }
    
    func test_InputWithSpace(){
        let result = cipher.encode("how are you", secret: "2")
        XCTAssertEqual(result, "Error: Input String Cannot contain space")
    }
    
    func test_DecodeAndEndcodeWithSpace(){
        let plaintext = "hello"
        
        let encodeText = cipher.encode(plaintext, secret: "2")
        let result = cipher.decode(encodeText!, secret: "4")
        XCTAssertEqual(plaintext, result)
    }
    
    
}
