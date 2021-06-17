public with sharing class ViewStateTestController {

public List<Row> rows {get;set;}

private static final Integer scaler = 5;

public class Row
{
    public Boolean isGrouping {get;set;}
    public Boolean selected {get;set;}
    public String name {get;set;}
    public String data1 {get;set;}
    public String data2 {get;set;}
    public String data3 {get;set;}
    public List<Row> children {get;set;}        
}

public ViewStateTestController()
{
    rows = new List<Row>();
    for(Integer group1Idx=0; group1Idx<scaler; group1Idx++)     
    {
        // Add group for level 2 data
        Row group1Row = new Row();
        group1Row.isGrouping = true;
        group1Row.Name = 'Level 1 Group';
        group1Row.children = new List<Row>();
        rows.add(group1Row);
        for(Integer group2Idx=0; group2Idx<scaler; group2Idx++)     
        {
            // Add some level 2 data
            for(Integer group2DataIdx=0; group2DataIdx<group2Idx+1; group2DataIdx++)
            {
                Row group2DataRow = new Row();
                group2DataRow.isGrouping = false;
                group2DataRow.Name = 'Level 2 Data';
                group2DataRow.data1 = 'Some Level 2 Data 1';
                group2DataRow.data2 = 'Some Level 2 Data 2';
                group2DataRow.data3 = 'Some Level 2 Data 3';                                
                group1Row.children.add(group2DataRow);
            }
            // Add group for level 3 data
            Row group2Row = new Row();
            group2Row.isGrouping = true;
            group2Row.Name = 'Level 2 Group';
            group2Row.children = new List<Row>();
            group1Row.children.add(group2Row);
            for(Integer group3Idx=0; group3Idx<scaler; group3Idx++)     
            {
                // Add some level 3 data
                for(Integer group3DataIdx=0; group3DataIdx<group3Idx+1; group3DataIdx++)
                {                   
                    Row group3DataRow = new Row();
                    group3DataRow.isGrouping = false;
                    group3DataRow.Name = 'Level 3 Data';
                    group3DataRow.data1 = 'Some Level 3 Data 1';
                    group3DataRow.data2 = 'Some Level 3 Data 2';
                    group3DataRow.data3 = 'Some Level 3 Data 3';                                
                    group2Row.children.add(group3DataRow);
                }
            }           
        }           
    }            
}
}