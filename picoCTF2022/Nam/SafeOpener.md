Đây là 1 bài cho sources code java 
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
```Java

Nhìn vào hàm main đầu tiên chúng ta có thể thấy nó cho người dùng nhập vào 1 xâu ktự và tiến hành decode bằng base64. wow đến đây thì mọi việc gần như xong được 90% rồi. Ta đã có thể đoán là nó dùng base64 để encode và dùng nó để so sánh với 1 chuỗi nào đó để check pwd đúng hay sai. và mọi việc trở nên rất dễ dàng khi đi tìm 1 chuỗi bla blap nào đó. và khi lướt xuống hàm boolean openSafe ta thấy 1 chuỗi String encodedkey = "cGwzYXMzX2wzdF9tM18xbnQwX3RoM19zYWYz"; và thêm cấu trúc if else bên dưới :

```Java
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
```
và việc cuối cungf cần lm là chỉ cần đem đống này "cGwzYXMzX2wzdF9tM18xbnQwX3RoM19zYWYz" decode bằng base64 



