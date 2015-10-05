public class main {
  public static void main(String[] args) {
      int arg = Integer.parseInt(args[0]);
      int sum = 0;

      while (arg-- > 0) {
        if (arg % 3 == 0 || arg % 5 == 0) {
            sum += arg;
        }
      }

      System.out.println(sum);
  }
}
