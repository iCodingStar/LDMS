package cn.cug.laboratory.model.persistent;

import lombok.Data;

import java.util.Date;

@Data
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
}