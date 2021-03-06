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
/*
  it will only accept a to z, A to Z, 0 to 9
  return only uppercase
  decode will only return uppercase
  secret cannot accept other than number
  decode can accept lowercase
 */

struct AlphanumericCesarCipher: Cipher {
    
    func encode(_ plaintext: String, secret: String) -> String? {
        guard let shiftBy = UInt32(secret) else {
            return nil
        }
        var encoded = ""
        let newplaintext = plaintext.uppercased()
        for character in newplaintext {
            
            let unicode = character.unicodeScalars.first!.value
            if (unicode < 48 || unicode > 122 || (unicode > 57 && unicode < 65) || (unicode > 90 && unicode < 97)) {
                return "Error: Input Contains Invalid Charactors"
            }
            
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

//shift everything 13 to right, limit between acsii code 48~126
//it will allow space " "
//secret doesn't use, can accept any input
struct ROT_13_Cipher: Cipher {
    func encode(_ plaintext: String, secret: String) -> String? {
        
        var encoded = ""
        
        for character in plaintext {
            
            let unicode = character.unicodeScalars.first!.value
            var shiftedUnicode = unicode + 13
            
            if shiftedUnicode > 126 {
                shiftedUnicode = shiftedUnicode - 79
            }
            
            let shiftedCharacter = String(UnicodeScalar(UInt8(shiftedUnicode)))
            encoded = encoded + shiftedCharacter

        }
        return encoded
    }
    
    func decode(_ plaintext: String, secret: String) -> String? {
        
        var decode = ""
        
        for character in plaintext {
            
            let unicode = character.unicodeScalars.first!.value
            var shiftedUnicode = unicode - 13
            var shiftedCharacter: String
            
            if shiftedUnicode < 48{
                shiftedUnicode = shiftedUnicode + 79
            }
            
            if unicode == 45{
                shiftedCharacter = " "
            }else{
                shiftedCharacter = String(UnicodeScalar(UInt8(shiftedUnicode)))
            }
            
            decode = decode + shiftedCharacter
        }
        return decode
    }
}

//shift everything 5 to left, limit between acsii code 48~126
//it will not allow space
//secret doesn't use, can accept any input
struct ROT_5_Cipher: Cipher {
    func encode(_ plaintext: String, secret: String) -> String? {
        
        var encoded = ""
        
        for character in plaintext {

            let unicode = character.unicodeScalars.first!.value
            if unicode == 32 {
                return "Error: Input String Cannot contain space"
            }else if unicode < 48{
                return "Error: Input Contains Invalid Charactors"
            }
            
            var shiftedUnicode = unicode - 5
            
            if shiftedUnicode < 48{
                shiftedUnicode = shiftedUnicode + 79
            }
           
            let shiftedCharacter = String(UnicodeScalar(UInt8(shiftedUnicode)))
            encoded = encoded + shiftedCharacter

        }
        return encoded
    }
    
    func decode(_ plaintext: String, secret: String) -> String? {
        
        var decode = ""
        
        for character in plaintext {
            
            let unicode = character.unicodeScalars.first!.value
            if unicode == 32 {
                return "Error: Input String Cannot contain space"
            }else if unicode < 48{
                return "Error: Input Contains Invalid Charactors"
            }
            
            var shiftedUnicode = unicode + 5

            if shiftedUnicode > 126 {
                shiftedUnicode = shiftedUnicode - 79
            }

            let shiftedCharacter = String(UnicodeScalar(UInt8(shiftedUnicode)))
  
            decode = decode + shiftedCharacter
        }
        return decode
    }

}
