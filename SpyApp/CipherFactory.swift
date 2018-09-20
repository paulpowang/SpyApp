import Foundation

struct CipherFactory {

    private var ciphers: [String: Cipher] = [
        "Ceasar": CeaserCipher(),
        "Alphanumeric": AlphanumericCesarCipher(),
        "ROT-13": ROT_13_Cipher(),
        "ROT-5": ROT_5_Cipher(),
    ]

    func cipher(for key: String) -> Cipher {
        return ciphers[key]!
    }
}
