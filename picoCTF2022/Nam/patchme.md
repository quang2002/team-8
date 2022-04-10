Đây là 1 bài đọc code python rất dễ dàng 

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
      print("false")
  
  
  
  level_1_pw_check()
 ```
 
 Ta có thể dễ dàng thấy hàm str_xor nhận 2 tham só secret và key và trả về là kết quả của việc decode file  flag.txt.enc cho ra cờ. Hàm này cơ chế hoạt động của nó tương tự caesa cipher. Và ta không cần quan tâm lắm đến nó vì nó chỉ có nhiệm vụ decode file flag.txt.enc. Tiếp đến ta sẽ xem xét đến hàm level_1_pw_check(). Dễ dàng nhận thấy hàm này cho người dùng nhập vào 1 xâu kí tự và so sánh nó. Nếu khớp thì sẽ gọi đến hàm str_xor truyền vào file mã hóa flag và key. dễ dàng nhận ra được password khi ghép các xâu con lại với nhau  

