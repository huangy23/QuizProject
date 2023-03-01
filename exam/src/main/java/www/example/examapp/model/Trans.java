package www.example.examapp.model;

public class Trans {
    private String Title;
    private String OptionA;
    private String OptionB;
    private String OptionC;
    private String OptionD;
    private String userchoice;

    public Trans(String title, String optionA, String optionB, String optionC, String optionD, String userchoice) {
        Title = title;
        OptionA = optionA;
        OptionB = optionB;
        OptionC = optionC;
        OptionD = optionD;
        this.userchoice = userchoice;
    }

    public String getTitle() {
        return Title;
    }

    public void setTitle(String title) {
        Title = title;
    }

    public String getOptionA() {
        return OptionA;
    }

    public void setOptionA(String optionA) {
        OptionA = optionA;
    }

    public String getOptionB() {
        return OptionB;
    }

    public void setOptionB(String optionB) {
        OptionB = optionB;
    }

    public String getOptionC() {
        return OptionC;
    }

    public void setOptionC(String optionC) {
        OptionC = optionC;
    }

    public String getOptionD() {
        return OptionD;
    }

    public void setOptionD(String optionD) {
        OptionD = optionD;
    }

    public String getUserchoice() {
        return userchoice;
    }

    public void setUserchoice(String userchoice) {
        this.userchoice = userchoice;
    }
}
