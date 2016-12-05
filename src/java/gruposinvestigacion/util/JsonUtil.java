/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package gruposinvestigacion.util;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

/**
 *
 * @author PedroRuiz
 */
public class JsonUtil {

    public static <T> String arrayToString(ArrayList<T> list) {
        Gson gson = new GsonBuilder()
                .setDateFormat("yyyy-mm-dd")
                .create();
        return gson.toJson(list);
    }

    public static <T> List<T> stringToArray(String s, Class<T[]> clazz) {
        Gson gson = new GsonBuilder()
                .setDateFormat("yyyy-mm-dd")
                .create();
        T[] arr = (T[]) gson.fromJson(s, clazz);
        return Arrays.asList(arr); //or return Arrays.asList(new Gson().fromJson(s, clazz)); for a one-liner
    }
}
