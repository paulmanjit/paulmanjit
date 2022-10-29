import java.util.ArrayList;
import java.util.Iterator;

public class Q23_ArrayList {
    public static void main(String a[]){
        ArrayList<String> arrl = new ArrayList<String>();
        //adding elements to the end
        arrl.add("One");
        arrl.add("Two");
        arrl.add("Three");
        arrl.add("Random");
        Iterator<String> itr = arrl.iterator();
        while(itr.hasNext()){
            System.out.println(itr.next());
        }
    }
}
