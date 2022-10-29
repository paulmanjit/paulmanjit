import java.util.Scanner;

public class Q5_Alphabet_Digit {
    public static void main(String args[]) {
        Scanner scanner = new Scanner(System.in);
        char char1 = scanner.next().charAt(0);
        if (char1 >= 48 && char1 <= 57) {
            System.out.print("char is Digit");

        } else if ((char1 >= 'a' && char1 <= 'z') || (char1 >= 'A' && char1 <= 'Z')) {
            System.out.print("char is Alphabet");
        } else {
            System.out.print("char is special character");

        }
    }
}
