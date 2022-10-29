import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;

public class SearchCSV {
    public static void main(String args[]) throws IOException {
        String result = searchColumnIndex("Indu");
        System.out.println("Result "+ result);
    }
    private static String searchColumnIndex( String searchString) throws IOException {
        String resultRow = null;
        BufferedReader br = new BufferedReader(new FileReader("/Users/manjitpaul/Downloads/testing/yob2012short.csv"));
        String line;
        while ( (line = br.readLine()) != null ) {
            String[] values = line.split(",");
            //if(values[searchColumnIndex].equals(searchString)) {
            if(line.contains(searchString)) {
                resultRow = line;
                break;
            }
        }
        br.close();
        return resultRow;
    }
}
