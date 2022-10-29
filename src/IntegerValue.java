import java.util.Scanner;

public class IntegerValue {
    // Check Value is Integer or Not in Java using While loop
        public static void main(String[] args) {
            Scanner in = new Scanner(System.in);

            String random_number;
            int f = 0, i = 0;

            System.out.print("Enter the number to check itself: ");
            random_number = in.nextLine();

            while (random_number.charAt(i) != '\0' && i < (random_number.length() - 1)) {
                if (random_number.charAt(i) == '.') {
                    f = 1;
                    break;
                }
                i++;
            }

            if (f == 1)
                System.out.println("\n" + random_number + " is a floating-point number.");
            else
                System.out.println("\n" + random_number + " is an integer number.");
        }
    }

