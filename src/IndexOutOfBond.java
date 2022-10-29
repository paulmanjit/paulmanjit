public class IndexOutOfBond {
    public static void main(String[ ] args) {
        try {
            int[] myNumbers = {1, 2, 3};
            System.out.println(myNumbers[10]); // error!
        } catch (Exception e) {
            System.out.println("OutOfBondException is solve by try catch");
        }

    }
}
