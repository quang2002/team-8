# [Reverse Engineering] patchme.py

Bài này cho chúng ta 2 files:
- patchme.flag.py
- flag.txt.enc

Đầu tiên mình sẽ mở file **flag.txt.enc** lên thì tất nhiên nó đã bị mã hóa. Và phương pháp mã hóa chắc chắn nằm trong **patchme.flag.py**

Mở file code lên thì mình thấy code như sau:
```Python
### THIS FUNCTION WILL NOT HELP YOU FIND THE FLAG --LT ########################
def str_xor(secret, key):
    #extend key to secret length
    new_key = key
    i = 0
    while len(new_key) < len(secret):
        new_key = new_key + key[i]
        i = (i + 1) % len(key)        
    return "".join([chr(ord(secret_c) ^ ord(new_key_c)) for (secret_c,new_key_c) in zip(secret,new_key)])
###############################################################################


flag_enc = open('flag.txt.enc', 'rb').read()



def level_1_pw_check():
    user_pw = input("Please enter correct password for flag: ")
    if( user_pw == "ak98" + \
                   "-=90" + \
                   "adfjhgj321" + \
                   "sleuth9000"):
        print("Welcome back... your flag, user:")
        decryption = str_xor(flag_enc.decode(), "utilitarian")
        print(decryption)
        return
    print("That password is incorrect")



level_1_pw_check()
```

Hàm mã hóa là str_xor và trông nó có vẻ phức tạp, hãy đi tìm thứ dễ tiếp cận hơn đã. Ở hàm level_1_pw_check mình thấy chương trình cho người dùng nhập password và nó thực hiện so sánh pass với một string khác, vậy là ra luôn rồi, chúng ta chỉ việc đem mớ string được nối với nhau kia ra làm password là xong. Nhưng mình lười lắm! Vậy nên mình xóa luôn đống code nhập pass và if đi, để nó chạy in ra flag luôn.

```Python
def level_1_pw_check():
    print("Welcome back... your flag, user:")
    decryption = str_xor(flag_enc.decode(), "utilitarian")
    print(decryption)
    return
```

> FLAG: picoCTF{p47ch1ng_l1f3_h4ck_c3daefb9}

[Previous](GDB%20Test%20Drive.md)  
[Next](Safe%20Opener.md)