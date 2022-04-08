# [Reverse Engineering] unpackme.py

Bài cho chúng ta file unpackme.py:

```Python
import base64
from cryptography.fernet import Fernet



payload = b'gAAAAABiMD1AoxgLLC2YSiRT0k3ng7iHEHbBPY7l7wx_kZaNMK797gLoS3Z0435G7KBqE1ZTOpgewA4_Ev-fb4rcw5c9wqS8Bbd18lJOT-xZp_argIklVDu0UB0fik_MNlAggIJWHYKHyihBED6RGDRv0UWPR7H35X_Ge6d4oPjy3MB2kGxx_tNUo18L8FPuQHqCueDAUiK19cMZcrOJwbGekZiLMH1Jz1fl4ej9tWROzqExPjp7mjwQFFrjrAhMnQtMuxG_umbkpBPCQEcgEF5LbT76Kmf8OQ=='

key_str = 'correctstaplecorrectstaplecorrec'
key_base64 = base64.b64encode(key_str.encode())
f = Fernet(key_base64)
plain = f.decrypt(payload)
exec(plain.decode())
```

Giờ là phân tích code:
Chúng ta thấy có payload có kiểu dữ liệu là bytes, xuống phía dưới dúng ta còn có thêm key nữa. Sau đó key này mã hóa qua base64 và sử dụng Fernet để giải mã cái payload trên kia.

Cuối cùng sau khi giải mã xong thì kết quả nằm trong plain, và chương trình gọi hàm exec (hàm exec là một hàm dùng để thực thi code python nhưng code đó được lưu vào 1 string). Vậy thì muốn giải bài này thì trước đó ta phải biết được code bài chạy là gì. Thay vì exec plain thì mình sẽ print nó ra:

```Python
pw = input('What\'s the password? ')

if pw == 'batteryhorse':
  print('picoCTF{175_chr157m45_188ab8c9}')
else:
  print('That password is incorrect.')
```

Đây là kết quả trong plain mình có được sau khi print ra.

> FLAG: picoCTF{175_chr157m45_188ab8c9}

[Previous](Safe%20Opener.md)  
[Next]()