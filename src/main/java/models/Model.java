package models;

import java.lang.reflect.Method;

public interface Model {

    public long getId();
    public void setId(long id);

    public static <T> T getProperty(Object obj, String property, T defaultValue) {

        T returnValue = (T) getProperty(obj, property);
        if (returnValue == null) {
            returnValue = defaultValue;
        }

        return returnValue;

    }

    public static Object getProperty(Object obj, String property) {
        Object returnValue = null;

        try {
            String methodName = "get" + property.substring(0, 1).toUpperCase() + property.substring(1, property.length());
            System.out.println(methodName);
            Class clazz = obj.getClass();
            Method method = clazz.getMethod(methodName, null);
            returnValue = method.invoke(obj, null);
            System.out.println(returnValue);
        }
        catch (Exception e) {
            // Do nothing, we'll return the default value
        }

        return returnValue;
    }
}
