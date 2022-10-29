import java.util.Iterator;
import java.util.LinkedList;

public class Q26_LinkedList {
    public static void main(String[] args) {
        // LinkedList creation
        LinkedList javaDevelopers = new LinkedList();

        // Adding elements to arraylist
        javaDevelopers.add("Preeti");
        javaDevelopers.add("Rani");
        javaDevelopers.add("Ganesh");
        javaDevelopers.add("Shameer");

        // Traversing LinkedList elements
        System.out.println("Java Developers:");
        Iterator iterator = javaDevelopers.iterator();
        while (iterator.hasNext())
            System.out.println(iterator.next());

    }



}
