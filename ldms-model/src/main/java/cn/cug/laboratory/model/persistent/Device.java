package cn.cug.laboratory.model.persistent;

import java.util.Date;

public class Device {
    private String id;

    private String labId;

    private String teaId;

    private String devId;

    private String subId;

    private String name;

    private String englishName;

    private String modelId;

    private String brand;

    private String subjectType;

    private Date purchaseTime;

    private Integer amount;

    private Integer amountUsed;

    private Float perPrice;

    private Float sumPrice;

    private String priceType;

    private String bill;

    private String unitOfMeasurement;

    private String fundFrom;

    private String propertyFrom;

    private String accountType;

    private String purchaseType;

    private String ps;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id == null ? null : id.trim();
    }

    public String getLabId() {
        return labId;
    }

    public void setLabId(String labId) {
        this.labId = labId == null ? null : labId.trim();
    }

    public String getTeaId() {
        return teaId;
    }

    public void setTeaId(String teaId) {
        this.teaId = teaId == null ? null : teaId.trim();
    }

    public String getDevId() {
        return devId;
    }

    public void setDevId(String devId) {
        this.devId = devId == null ? null : devId.trim();
    }

    public String getSubId() {
        return subId;
    }

    public void setSubId(String subId) {
        this.subId = subId == null ? null : subId.trim();
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public String getEnglishName() {
        return englishName;
    }

    public void setEnglishName(String englishName) {
        this.englishName = englishName == null ? null : englishName.trim();
    }

    public String getModelId() {
        return modelId;
    }

    public void setModelId(String modelId) {
        this.modelId = modelId == null ? null : modelId.trim();
    }

    public String getBrand() {
        return brand;
    }

    public void setBrand(String brand) {
        this.brand = brand == null ? null : brand.trim();
    }

    public String getSubjectType() {
        return subjectType;
    }

    public void setSubjectType(String subjectType) {
        this.subjectType = subjectType == null ? null : subjectType.trim();
    }

    public Date getPurchaseTime() {
        return purchaseTime;
    }

    public void setPurchaseTime(Date purchaseTime) {
        this.purchaseTime = purchaseTime;
    }

    public Integer getAmount() {
        return amount;
    }

    public void setAmount(Integer amount) {
        this.amount = amount;
    }

    public Integer getAmountUsed() {
        return amountUsed;
    }

    public void setAmountUsed(Integer amountUsed) {
        this.amountUsed = amountUsed;
    }

    public Float getPerPrice() {
        return perPrice;
    }

    public void setPerPrice(Float perPrice) {
        this.perPrice = perPrice;
    }

    public Float getSumPrice() {
        return sumPrice;
    }

    public void setSumPrice(Float sumPrice) {
        this.sumPrice = sumPrice;
    }

    public String getPriceType() {
        return priceType;
    }

    public void setPriceType(String priceType) {
        this.priceType = priceType == null ? null : priceType.trim();
    }

    public String getBill() {
        return bill;
    }

    public void setBill(String bill) {
        this.bill = bill == null ? null : bill.trim();
    }

    public String getUnitOfMeasurement() {
        return unitOfMeasurement;
    }

    public void setUnitOfMeasurement(String unitOfMeasurement) {
        this.unitOfMeasurement = unitOfMeasurement == null ? null : unitOfMeasurement.trim();
    }

    public String getFundFrom() {
        return fundFrom;
    }

    public void setFundFrom(String fundFrom) {
        this.fundFrom = fundFrom == null ? null : fundFrom.trim();
    }

    public String getPropertyFrom() {
        return propertyFrom;
    }

    public void setPropertyFrom(String propertyFrom) {
        this.propertyFrom = propertyFrom == null ? null : propertyFrom.trim();
    }

    public String getAccountType() {
        return accountType;
    }

    public void setAccountType(String accountType) {
        this.accountType = accountType == null ? null : accountType.trim();
    }

    public String getPurchaseType() {
        return purchaseType;
    }

    public void setPurchaseType(String purchaseType) {
        this.purchaseType = purchaseType == null ? null : purchaseType.trim();
    }

    public String getPs() {
        return ps;
    }

    public void setPs(String ps) {
        this.ps = ps == null ? null : ps.trim();
    }
}