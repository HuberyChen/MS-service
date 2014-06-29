package testMS;

public class Tools {
    public static String toChinese(String strvalue)
    {
        try{
            if(strvalue==null)
            return null;
            else
            {
                strvalue = new String(strvalue.getBytes("ISO8859_1"), "GBK");
                return strvalue;
            }
        }catch(Exception e){
            return null;
        }
    }
    /** Creates a new instance of Tools */
    public Tools() {
    }
    
}
