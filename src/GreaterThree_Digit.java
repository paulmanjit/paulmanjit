import java.util.Scanner;

public class GreaterThree_Digit {
    public static void main(String[] args) {
        Scanner s = new Scanner(System.in);

        System.out.println("Enter no1");
        int no1 = s.nextInt();

        System.out.println("Enter no2");
        int no2 = s.nextInt();

        System.out.println("Enter no3");
        int no3 = s.nextInt();

        if (no1 > no2 && no1 > no3) {
            System.out.println(no1 + " is greater");
        } else if (no2 > no1 && no2 > no3) {
            System.out.println(no2 + " is greater");
        } else {
            System.out.println(no3 + " is greater");
        }
    }
}
