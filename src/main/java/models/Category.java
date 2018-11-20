package models;

public class Category implements Model {

    private long id;
    private String name;
    private String icon;
    private int sort_order;
    private String type;
    private long user_id;
    private User owner;
    private long parent_id;
    private Category parent;

    public static final String TYPE_EXPENCE = "expence";
    public static final String TYPE_INCOME = "income";

    public static final long ROOT_CATEGORY = 0;

    public Category() {}

    public Category(long id) {
        this.id = id;
    }

    public Category(long id, String name, User owner) {
        this.id = id;
        this.name = name;
        this.sort_order = (int) id;
        this.type = TYPE_EXPENCE;
        this.owner = owner;
        this.user_id = owner.getId();
    }

    public Category(int id, String name, String type, User owner) {
        this.id = id;
        this.name = name;
        this.sort_order = id;
        this.type = type;
        this.owner = owner;
    }

    public String getName() {
        return name;
    }

    public String getType() {
        return type;
    }

    @Override
    public long getId() {
        return id;
    }

    @Override
    public void setId(long id) {
        this.id = id;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getIcon() {
        return icon;
    }

    public void setIcon(String icon) {
        this.icon = icon;
    }

    public int getSort_order() {
        return sort_order;
    }

    public void setSort_order(int sort_order) {
        this.sort_order = sort_order;
    }

    public void setType(String type) {
        this.type = type;
    }

    public User getOwner() {
        return owner;
    }

    public long getUser_id() { return user_id; }

    public void setOwner(User owner) {
        this.owner = owner;
        this.user_id = owner.getId();
    }

    public Category getParent() {
        return parent;
    }

    public long getParent_id() { return parent_id; }

    public void setParent(Category parent) {
        this.parent = parent;
        this.parent_id = parent.getId();
    }
}
