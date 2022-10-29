import java.util.Scanner;

public class UserInput {
    public static void main(String[] args)
    {
        Scanner s=new Scanner(System.in);

        System.out.println("Enter your name");
        String name=s.next();

        System.out.println("Enter your age");
        int age=s.nextInt();

        System.out.println("Your name is "+name+" and your age is "+age);
    }
}

