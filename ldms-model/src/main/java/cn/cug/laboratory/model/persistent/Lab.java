package cn.cug.laboratory.model.persistent;

public class Lab {
    private String id;

    private String name;

    private Integer size;

    private String openWay;

    private String manager;

    private String useWay;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id == null ? null : id.trim();
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public Integer getSize() {
        return size;
    }

    public void setSize(Integer size) {
        this.size = size;
    }

    public String getOpenWay() {
        return openWay;
    }

    public void setOpenWay(String openWay) {
        this.openWay = openWay == null ? null : openWay.trim();
    }

    public String getManager() {
        return manager;
    }

    public void setManager(String manager) {
        this.manager = manager == null ? null : manager.trim();
    }

    public String getUseWay() {
        return useWay;
    }

    public void setUseWay(String useWay) {
        this.useWay = useWay == null ? null : useWay.trim();
    }
}