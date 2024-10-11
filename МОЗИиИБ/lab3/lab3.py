def get_alphabet(option="eng"):
    if option == "eng":
        return list(map(chr, range(ord("a"), ord("z")+1)))
    elif option == "rus":
        return list(map(chr, range(ord("а"), ord("я")+1)))
    
def gamma_encryption(message: str, gamma: str):
    alphabet = get_alphabet()

    if all(letter.lower() in alphabet for letter in message):
        alphabet = get_alphabet("eng")
    else:
        alphabet = get_alphabet("rus")
    
    m = len(alphabet)

    def encrypt(letters_pair: tuple):
        idx = (letters_pair[0] + letters_pair[1]) % m
        return idx
    
    message_cleared = list(filter(lambda s: s.lower() in alphabet, message))
    gamma_cleared = list(filter(lambda s: s.lower() in alphabet, gamma))

    message_ind = list(map(lambda s: alphabet.index(s.lower()), message_cleared))
    gamma_ind = list(map(lambda s: alphabet.index(s.lower()), gamma_cleared))

    for i in range(len(message_ind) - len (gamma_ind)):
        gamma_ind.append(gamma_ind[i % len(gamma_ind)])
    
    print(f'{message.upper()} -> {message_ind}')
    print(f'{gamma.upper()} -> {gamma_ind}')

    encrypted_ind = list(map(lambda s: encrypt(s), zip(message_ind, gamma_ind)))

    print(f'ENCRYPITION FORM: {encrypted_ind}\n')

    return ''.join(list(map(lambda s: alphabet[s],encrypted_ind))).upper()

def test_encryption(message: str, gamma: str):
    print(f'ENCRYPTION RESULT: {gamma_encryption(message, gamma)}')

def main():
    message = "приказ"
    gamma = "гамма"
    print("TEST 1")
    test_encryption(message, gamma)

    message = "здравствуйте"
    gamma = "привет"
    print("TEST 2")
    test_encryption(message, gamma)

if __name__ == "__main__":
    main()
