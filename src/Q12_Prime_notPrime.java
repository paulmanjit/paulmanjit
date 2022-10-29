public class Q12_Prime_notPrime {
    public static void main(String[] args) {
            int no=8;
            int temp=0;
            for(int i=2; i<=no-1; i++)
            {
                if(no%i == 0)
                {
                    temp=temp+1;
                }
            }
            if(temp == 0)
            {
                System.out.println("prime no");
            }
            else
            {
                System.out.println("not prime");
            }
        }
    }

