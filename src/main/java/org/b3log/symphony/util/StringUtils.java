package org.b3log.symphony.util;

/**
 * Created by Seven on 17/5/14.
 */
public class StringUtils {

    public static boolean isEmpty(String str)
  {
     return (str == null) || (str.trim().length() == 0);
   }
}
