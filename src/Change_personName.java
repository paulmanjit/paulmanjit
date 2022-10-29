public class Change_personName {
    public static void main(String[] args) {
        String s = args[0];
        String x = args[1];
        String y = args[2];
        String[] arr = new String[]{s, x, y};
        System.out.println(" ");
        System.out.println("Hi");
        for (int i = arr.length; i > 0; i--) {

            System.out.println(arr[i - 1]);
            System.out.println(" ");
        }
    }
}
