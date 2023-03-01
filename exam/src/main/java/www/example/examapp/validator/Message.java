package www.example.examapp.validator;

import java.util.HashMap;
import java.util.Map;


public class Message {


    private int code;


    private String message;


    private Map<String, Object> extend = new HashMap<String, Object>();

    public static Message success(){
        Message result = new Message();
        result.setCode(100);
        result.setMessage("Processing success！");
        return result;
    }

    public static Message fail(){
        Message result = new Message();
        result.setCode(200);
        result.setMessage("Processing failure！");
        return result;
    }

    public Message add(String key,Object value){
        this.getExtend().put(key, value);
        return this;
    }

    public int getCode() {
        return code;
    }

    public void setCode(int code) {
        this.code = code;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public Map<String, Object> getExtend() {
        return extend;
    }

    public void setExtend(Map<String, Object> extend) {
        this.extend = extend;
    }
}
