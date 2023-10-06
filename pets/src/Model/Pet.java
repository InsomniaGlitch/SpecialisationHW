package Model;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

public abstract class Pet {
    protected int petId;
    protected String name;
    protected LocalDate birthday;

    public int getPetId() {
        return petId;
    }

    public void setPetId(int petId) {
        this.petId = petId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setBirthdayDate(LocalDate birthday) {
        this.birthday = birthday;
    }

    public String getBirthdayDate() {
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd.MM.yyyy");
        return formatter.format(birthday);
    }

    @Override
    public String toString() {
        return String.format("%d. %s: имя: %s, дата рождения: %s" , getPetId(), getClass().getSimpleName(), name, getBirthdayDate());
    }
}