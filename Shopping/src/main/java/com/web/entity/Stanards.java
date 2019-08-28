package com.web.entity;

import java.io.Serializable;

public class Stanards implements Serializable {
    private Integer standardId;

    private static final long serialVersionUID = 1L;

    public Integer getStandardId() {
        return standardId;
    }

    public void setStandardId(Integer standardId) {
        this.standardId = standardId;
    }
}