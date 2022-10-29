import java.util.Enumeration;
import java.util.Vector;

public class Q27_Vector {
    public static void main (String[] args)
    {

        // Vector creation
        Vector javaDevelopers = new Vector();

        //Adding elements to vector
        javaDevelopers.addElement("Rajiv");
        javaDevelopers.addElement("Radha");
        javaDevelopers.addElement("Ganesh");
        javaDevelopers.addElement("Shalu");

        // Traversing vector elements
        System.out.println("Java Developers:");
        Enumeration enumeration = javaDevelopers.elements();
        while (enumeration.hasMoreElements())
            System.out.println(enumeration.nextElement());
    }
}
