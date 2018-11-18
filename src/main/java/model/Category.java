package model;

public class Category implements Model {

    private long id;
    private String tableName;
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

    Category() {}

    Category(int id, String name, User owner) {
        this.id = id;
        this.name = name;
        this.sort_order = id;
        this.type = TYPE_EXPENCE;
        this.owner = owner;
        this.user_id = owner.getId();
    }

    Category(int id, String name, String type, User owner) {
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
    public String getTableName() {
        return tableName;
    }
}
