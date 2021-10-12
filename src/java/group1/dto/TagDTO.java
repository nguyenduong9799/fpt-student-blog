/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package group1.dto;


public class TagDTO {
    
    private int tagID;
    private String tagName;
    private String createDate;

    public TagDTO() {
    }

    public TagDTO(int tagID, String tagName, String createDate) {
        this.tagID = tagID;
        this.tagName = tagName;
        this.createDate = createDate;
    }

    public TagDTO(int tagID, String tagName) {
        this.tagID = tagID;
        this.tagName = tagName;
    }


    public int getTagID() {
        return tagID;
    }

    public void setTagID(int tagID) {
        this.tagID = tagID;
    }

    public String getTagName() {
        return tagName;
    }

    public void setTagName(String tagName) {
        this.tagName = tagName;
    }

    public String getCreateDate() {
        return createDate;
    }

    public void setCreateDate(String createDate) {
        this.createDate = createDate;
    }

}
