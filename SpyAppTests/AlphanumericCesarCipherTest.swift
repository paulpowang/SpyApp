//
//  AlphanumericCesarCipherTest.swift
//  SpyAppTests
//
//  Created by paul on 9/19/18.
//  Copyright © 2018 Axel Ancona Esselmann. All rights reserved.
//

import XCTest
@testable import SpyApp

class AlphanumericCesarCipherTest: XCTestCase {
    
    var cipher: Cipher!
    
    override func setUp() {
        super.setUp()
        cipher = AlphanumericCesarCipher()
    }
    
    func test_oneCharacterStirngGetsMappedToSelfWith_0_secret() {
        let plaintext = "A"
        
        let result = cipher.encode(plaintext, secret: "0")
        
        XCTAssertEqual(plaintext, result)
    }
    
    func test_nonNumericInputForSecret() {
        let result = cipher.encode("b", secret: "nonNumericString")
        
        XCTAssertNil(result)
    }
    
    func test_InvalidCharactorInput(){
        let result = cipher.encode("@#$", secret: "2")
        XCTAssertEqual(result, "Error: Input Contains Invalid Charactors")
    }
    
}
