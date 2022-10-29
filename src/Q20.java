import java.util.Scanner;

public class Q20 {
    // The MAIN Function

    public static void main(String[] args) {

        // Creating object of scanner class

        Scanner sc = new Scanner(System.in);

        // Displaying a message on the screen

        System.out.println("Below are the numbers signifying each operation. Choose what operation you'd like to perform.\n");

        System.out.println("Addition - 1\nSubtraction - 2\nMultiplication - 3\nDivision - 4\nModulus - 5\n");

        // Taking user input to accept the operation

        System.out.print("Enter the operation you'd like to perform [1/2/3/4/5]: ");

        // Take Input for choice

        int choice = sc.nextInt();

        // Checking if choice is 1 or not by using if statement ans displaying result

        if (choice == 1) {

            System.out.print("Enter the first number: ");

            double a = sc.nextDouble();

            System.out.print("Enter the second number: ");

            double b = sc.nextDouble();

            System.out.println("You've chosen addition. The resultant value is " + (a+b));

        }

        // Checking if choice is 2 or not by using else..if statement and displaying result

        else if (choice == 2) {

            System.out.print("Enter the first number: ");

            double a = sc.nextDouble();

            System.out.print("Enter the second number: ");

            double b = sc.nextDouble();

            System.out.println("You've chosen subtraction. The resultant value is " + (a-b));

        }

        // Checking if choice is 3 or not by using else..if statement and displaying result

        else if (choice == 3) {

            System.out.println("Enter the first number: ");

            double a = sc.nextDouble();

            System.out.print("Enter the second number: ");

            double b = sc.nextDouble();

            System.out.println("You've chosen multiplication. The resultant value is " + (a*b));

        }

        // Checking if choice is 4 or not by using else..if statement and displaying result

        else if (choice == 4) {

            System.out.print("Enter the first number: ");

            double a = sc.nextDouble();

            System.out.print("Enter the second number: ");

            double b = sc.nextDouble();

            System.out.println("You've chosen division. The resultant value is " + (a/b));

        }

        // Checking if choice is 5 or not by using else..if statement and displaying result

        else if (choice == 5) {

            System.out.print("Enter the first number: ");

            double a = sc.nextDouble();

            System.out.print("Enter the second number: ");

            double b = sc.nextDouble();

            System.out.println("You've chosen floor division. The resultant value is " + (a%b));

        }

        else {

            System.out.println("Invalid input. Please try again by entering valid input and/or operation.");

        }

        // Closing Scanner class

        sc.close();

    }
}
