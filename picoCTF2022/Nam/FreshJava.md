Đến với bài này. Đây là 1 bài cho chúng ta file .class . Đây là 1 file thực thi được tạo ra bằng cách compile file java. cho nên suy nghĩ tiên chúng ta là sẽ đem decompile nó bằng tool để xem có thể thu được gì không. thì may mắn là đã xuất hiện 1 chương trình java rất dễ đọc 


```C
import java.util.Scanner;

public class KeygenMe
{
    public static void main(final String[] array) {
        final Scanner scanner = new Scanner(System.in);
        System.out.println("Enter key:");
        final String nextLine = scanner.nextLine();
        if (nextLine.length() != 34) {
            System.out.println("Invalid key");
            return;
        }
        if (nextLine.charAt(33) != '}') {
            System.out.println("Invalid key");
            return;
        }
        if (nextLine.charAt(32) != '9') {
            System.out.println("Invalid key");
            return;
        }
        if (nextLine.charAt(31) != '8') {
            System.out.println("Invalid key");
            return;
        }
        if (nextLine.charAt(30) != 'c') {
            System.out.println("Invalid key");
            return;
        }
        if (nextLine.charAt(29) != 'a') {
            System.out.println("Invalid key");
            return;
        }
        if (nextLine.charAt(28) != 'c') {
            System.out.println("Invalid key");
            return;
        }
        if (nextLine.charAt(27) != '8') {
            System.out.println("Invalid key");
            return;
        }
        if (nextLine.charAt(26) != '3') {
            System.out.println("Invalid key");
            return;
        }
        if (nextLine.charAt(25) != '7') {
            System.out.println("Invalid key");
            return;
        }
        if (nextLine.charAt(24) != '_') {
            System.out.println("Invalid key");
            return;
        }
        if (nextLine.charAt(23) != 'd') {
            System.out.println("Invalid key");
            return;
        }
        if (nextLine.charAt(22) != '3') {
            System.out.println("Invalid key");
            return;
        }
        if (nextLine.charAt(21) != 'r') {
            System.out.println("Invalid key");
            return;
        }
        if (nextLine.charAt(20) != '1') {
            System.out.println("Invalid key");
            return;
        }
        if (nextLine.charAt(19) != 'u') {
            System.out.println("Invalid key");
            return;
        }
        if (nextLine.charAt(18) != 'q') {
            System.out.println("Invalid key");
            return;
        }
        if (nextLine.charAt(17) != '3') {
            System.out.println("Invalid key");
            return;
        }
        if (nextLine.charAt(16) != 'r') {
            System.out.println("Invalid key");
            return;
        }
        if (nextLine.charAt(15) != '_') {
            System.out.println("Invalid key");
            return;
        }
        if (nextLine.charAt(14) != 'g') {
            System.out.println("Invalid key");
            return;
        }
        if (nextLine.charAt(13) != 'n') {
            System.out.println("Invalid key");
            return;
        }
        if (nextLine.charAt(12) != '1') {
            System.out.println("Invalid key");
            return;
        }
        if (nextLine.charAt(11) != 'l') {
            System.out.println("Invalid key");
            return;
        }
        if (nextLine.charAt(10) != '0') {
            System.out.println("Invalid key");
            return;
        }
        if (nextLine.charAt(9) != '0') {
            System.out.println("Invalid key");
            return;
        }
        if (nextLine.charAt(8) != '7') {
            System.out.println("Invalid key");
            return;
        }
        if (nextLine.charAt(7) != '{') {
            System.out.println("Invalid key");
            return;
        }
        if (nextLine.charAt(6) != 'F') {
            System.out.println("Invalid key");
            return;
        }
        if (nextLine.charAt(5) != 'T') {
            System.out.println("Invalid key");
            return;
        }
        if (nextLine.charAt(4) != 'C') {
            System.out.println("Invalid key");
            return;
        }
        if (nextLine.charAt(3) != 'o') {
            System.out.println("Invalid key");
            return;
        }
        if (nextLine.charAt(2) != 'c') {
            System.out.println("Invalid key");
            return;
        }
        if (nextLine.charAt(1) != 'i') {
            System.out.println("Invalid key");
            return;
        }
        if (nextLine.charAt(0) != 'p') {
            System.out.println("Invalid key");
            return;
        }
        System.out.println("Valid key");
    }
}
```
Ở đây ta có các câu điều kiện if else để kiểm tra từng kí tự trong xâu nhập vào. Nếu khác 1 kí tự thì chương trình sẽ kết thúc và trả là invalid key. Nếu chạy đến cuối sẽ in ra valid key. Do đó ta chỉ gần ghép các kí tự để lấy được flag. 
