import java.util.Scanner;

public class Reverse {
    public static void main(String[] args) {
            Scanner in = new Scanner(System.in);
            System.out.println("Enter a string to make reverse::\n");
            String x = in.nextLine();
            System.out.print ("The reverse of the string is:: ");

            for (int i = (x.length()-1); i >= 0; i--) {
                System.out.print (x.charAt(i));
            }
            System.out.println("\n");
        }
    }

