import Foundation

protocol Cipher {
    func encode(_ plaintext: String, secret: String) -> String?
    func decode(_ plaintext: String, secret: String) -> String?
}

struct CeaserCipher: Cipher {

    func encode(_ plaintext: String, secret: String) -> String? {
        guard let shiftBy = UInt32(secret) else {
            return nil
        }
        var encoded = ""

        for character in plaintext {
            let unicode = character.unicodeScalars.first!.value
            let shiftedUnicode = unicode + shiftBy
            let shiftedCharacter = String(UnicodeScalar(UInt8(shiftedUnicode)))
            encoded = encoded + shiftedCharacter
        }
        return encoded
    }
    
    func decode(_ plaintext: String, secret: String) -> String? {
        guard let shiftBy = UInt32(secret) else {
            return nil
        }
        var decode = ""
        
        for character in plaintext {
            let unicode = character.unicodeScalars.first!.value
            let shiftedUnicode = unicode - shiftBy
            let shiftedCharacter = String(UnicodeScalar(UInt8(shiftedUnicode)))
            decode = decode + shiftedCharacter
        }
        return decode
    }
    
    
    
}

struct AlphanumericCesarCipher: Cipher {
    
    func encode(_ plaintext: String, secret: String) -> String? {
        guard let shiftBy = UInt32(secret) else {
            return nil
        }
        var encoded = ""
        let newplaintext = plaintext.uppercased()
        for character in newplaintext {
            
            let unicode = character.unicodeScalars.first!.value
            
            var shiftedUnicode = unicode + shiftBy
            
            //Z to 0, 9 to A
            if shiftBy > 0 && shiftedUnicode > 90 {
                shiftedUnicode = shiftedUnicode - 43
            }else if shiftBy > 0 && shiftedUnicode > 57 && shiftedUnicode < 65{
                shiftedUnicode = shiftedUnicode + 7
            }else if shiftBy < 0 && shiftedUnicode < 48 {
                shiftedUnicode = shiftedUnicode + 43
            }else if shiftBy < 0 && shiftedUnicode > 57 && shiftedUnicode < 65{
                shiftedUnicode = shiftedUnicode - 7
            }
            
            let shiftedCharacter = String(UnicodeScalar(UInt8(shiftedUnicode)))
            encoded = encoded + shiftedCharacter
        }
        return encoded
    }
    
    func decode(_ plaintext: String, secret: String) -> String? {
        guard let shiftBy = UInt32(secret) else {
            return nil
        }
        var decode = ""
        
        let newplaintext = plaintext.uppercased()
        
        for character in newplaintext {
            
            let unicode = character.unicodeScalars.first!.value
            
            var shiftedUnicode = unicode - shiftBy
            
            //Z to 0, 9 to A
            if shiftBy > 0 && shiftedUnicode > 90 {
                shiftedUnicode = shiftedUnicode - 43
            }else if shiftBy > 0 && shiftedUnicode > 57 && shiftedUnicode < 65{
                shiftedUnicode = shiftedUnicode + 7
            }else if shiftBy < 0 && shiftedUnicode < 48 {
                shiftedUnicode = shiftedUnicode + 43
            }else if shiftBy < 0 && shiftedUnicode > 57 && shiftedUnicode < 65{
                shiftedUnicode = shiftedUnicode - 7
            }
            
            let shiftedCharacter = String(UnicodeScalar(UInt8(shiftedUnicode)))
            decode = decode + shiftedCharacter
        }
        return decode
    }
    
}
