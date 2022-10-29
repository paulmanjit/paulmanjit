import java.util.Scanner;

public class Q19_PrintFirst5Value {
    public static void main(String[] args)
    {
        Scanner sc = new Scanner(System.in);
        long x = sc.nextLong();   // first number input
        long y = sc.nextLong();   // second number input
        long num = 0;            // new variable num -- means all the numbers between these to given input numbers
        long count = 0;            // loop counter - how many numbers are divided by 2 or 3 or 5
        for (num = x; x <= num && num <= y; num++) {
            if (num % 2 == 0 | num % 3 == 0 | num % 5 == 0) {
                count = count + 1;             // increasing the counter by 1, so that every time the loop repeats, the counter increases...
            }
        }
        System.out.println(count);  // prints out how many numbers are divided by 2 or 3 or 5 ...
    }
}
