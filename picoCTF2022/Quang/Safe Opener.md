# [Reverse Engineering] Safe Opener

Lại tiếp tục là một bài đọc code, đề cho chúng ta source code java:

```Java
import java.io.*;
import java.util.*;  
public class SafeOpener {
    public static void main(String args[]) throws IOException {
        BufferedReader keyboard = new BufferedReader(new InputStreamReader(System.in));
        Base64.Encoder encoder = Base64.getEncoder();
        String encodedkey = "";
        String key = "";
        int i = 0;
        boolean isOpen;
        

        while (i < 3) {
            System.out.print("Enter password for the safe: ");
            key = keyboard.readLine();

            encodedkey = encoder.encodeToString(key.getBytes());
            System.out.println(encodedkey);
              
            isOpen = openSafe(encodedkey);
            if (!isOpen) {
                System.out.println("You have  " + (2 - i) + " attempt(s) left");
                i++;
                continue;
            }
            break;
        }
    }
    
    public static boolean openSafe(String password) {
        String encodedkey = "cGwzYXMzX2wzdF9tM18xbnQwX3RoM19zYWYz";
        
        if (password.equals(encodedkey)) {
            System.out.println("Sesame open");
            return true;
        }
        else {
            System.out.println("Password is incorrect\n");
            return false;
        }
    }
}
```

Chúng ta thấy ở hàm main đơn giản là cho user nhập password, sau đó mã hóa nó bằng base64 và kiểm tra password sau khi mã hóa bằng hàm openSafe, trong hàm openSafe ta thấy được encodedKey là string dùng để so sánh, nếu equals thì nó return true. Vậy mình biết được đây chính là password sau khi mã hóa mà mình cần, giờ công việc là decode nó thôi. 

Mình sử dụng [base64decode](https://www.base64decode.org/) và được kết quả là:
> pl3as3_l3t_m3_1nt0_th3_saf3

Ghép nó thành flag theo như hướng dẫn đề bài ta được:

> FLAG: picoCTF{pl3as3_l3t_m3_1nt0_th3_saf3}

[Previous](patchme.py.md)  
[Next](unpackme.py.md)