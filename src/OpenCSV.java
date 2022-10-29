import com.CSVReader;
import com.exceptions.CsvException;

import java.io.FileReader;
import java.io.IOException;
import java.util.Arrays;
import java.util.Comparator;
import java.util.HashMap;
import java.util.Map;

public class OpenCSV {
    public void totalBirths(String fileName) throws IOException, CsvException {

        int totalGirls = 0;

        int totalBoys = 0;
        int totalBirths = 0;

        try (CSVReader reader = new CSVReader(new FileReader(fileName))) {
            String[] lineInArray;
            while ((lineInArray = reader.readNext()) != null) {
                int numBorn = Integer.parseInt(lineInArray[2]);
                String gender = lineInArray[1];
                totalBirths += numBorn;
                if (gender.equals("M")) {
                    totalBoys += numBorn;
                } else {
                    totalGirls += numBorn;
                }

            }
        }

        System.out.println("Total number of birth: " + totalBirths);
        System.out.println("Boys: " + totalBoys);
        System.out.println("Girls: " + totalGirls);

    }

    public void getRank(String name, String gender, int year) throws IOException, CsvException {
        String fileName = "=> Update your path => /yob" + year + "short.csv";
        HashMap<String, Integer> names = new HashMap<>();
        try (CSVReader reader = new CSVReader(new FileReader(fileName))) {
            String[] lineInArray;
            while ((lineInArray = reader.readNext()) != null) {
                //System.out.println("gender " +lineInArray[1]);
                if (lineInArray[1].equals("F")) {
                    names.put(lineInArray[0], Integer.valueOf(lineInArray[2]));
                    //System.out.println("name: " +names);
                } else {
                    //System.out.println("false");
                }


                // System.out.println("Name:"+lineInArray[0] +" \n Gender"+ lineInArray[1] + "number" + lineInArray[2]);

            }
        }
        //   System.out.println(names);
        Object[] a = names.entrySet().toArray();
        Arrays.sort(a, new Comparator() {
            public int compare(Object o1, Object o2) {
                return ((Map.Entry<String, Integer>) o2).getValue()
                        .compareTo(((Map.Entry<String, Integer>) o1).getValue());
            }
        });
        for (Object e : a) {
            System.out.println(((Map.Entry<String, Integer>) e).getKey() + " : "
                    + ((Map.Entry<String, Integer>) e).getValue());
        }


        // System.out.println(name+gender+year);
    }

    public static void main(String[] args) throws IOException, CsvException {

        String fileName = "/Users/manjitpaul/Downloads/testing/yob2012short.cvs";

        OpenCSV fr = new OpenCSV();
        System.out.println("Birth Details");
        fr.totalBirths(fileName);
        System.out.println("Rank");
        fr.getRank("sophia", "F", 2012);

    }


}
