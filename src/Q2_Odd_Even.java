import java.util.Scanner;

public class Q2_Odd_Even {
    public static void main(String[] args) {
        Scanner in = new Scanner(System.in);

        int x;
        System.out.println ("Enter an integer number to check:\n");

        x = in.nextInt();

        if (x % 2 == 0) {
            System.out.println ("The input number is even.\n");
        } else {
            System.out.println ("The input number is odd.\n");
        }
    }
}
