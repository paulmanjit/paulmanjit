public class Q13_PrimeNO_10_99 {
    public static void main(String[] args)
    {
        for(int no=10; no<=99; no++)
        {
            int temp=0;
            for(int i=2; i<=no-1; i++)
            {
                if(no%i == 0)
                {
                    temp=temp+1;
                }
            }
            if(temp==0)
            {
                System.out.println(no);
            }
        }
    }
}
