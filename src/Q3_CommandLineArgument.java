import java.util.Scanner;

public class Q3_CommandLineArgument {
    public static void main(String[] args) {

        Scanner scanner = new Scanner(System.in);
        System.out.print("Enter some cities ");
        String cities = scanner.nextLine();

        if (cities.length() == 0) {
            System.out.println("No Values ");
        } else {
            String[] arrayCities = cities.split(" ");
            System.out.print("Your values: ");

            for (int i = 0; i < arrayCities.length; i++) {
                System.out.print(arrayCities[i] + ", ");
            }
        }
    }
}