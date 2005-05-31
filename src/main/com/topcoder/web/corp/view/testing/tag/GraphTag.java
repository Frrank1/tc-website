/*
 * GraphTag.java
 *
 * Created on May 31, 2005, 4:43 PM
 *
 * To change this template, choose Tools | Options and locate the template under
 * the Source Creation and Management node. Right-click the template and choose
 * Open. You can then make changes to the template in the Source Editor.
 */

package com.topcoder.web.corp.view.testing.tag;

import java.io.IOException;
import java.util.List;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.TagSupport;

/**
 *
 * @author rfairfax
 */
public class GraphTag extends TagSupport {
    
    private int graphAreaHeight = 300;
    
    public void setGraphAreaHeight(int v) {
        graphAreaHeight = v;
    }
    
    private int barWidth = 25;
    
    public void setBarWidth(int v) {
        barWidth = v;
    }
    
    private List yAxisLabels = null;
    
    public void setYAxisLabels(List l) {
        yAxisLabels = l;
    }
        
    private int yAxisSections = 0;
    private int yUnitSize = 1;
    
    private List xAxisLabels = null;
    
    public void setXAxisLabels(List l) {
        xAxisLabels = l;
    }
            
    private int xAxisSections = 0;
    
    private List barValues = null;
    
    public void setBarValues(List l) {
        barValues = l;
    }
    
    public int doStartTag() throws JspException {
        //initialize / calc some values
        xAxisSections = xAxisLabels.size();
        yAxisSections = yAxisLabels.size();
        //find max value for y_unit_size
        int max = 0;
        for(int i = 0; i < xAxisSections; i++) {
            int b = ((Integer)barValues.get(i)).intValue();
            if(b > max)
                max = b;
        }
        
        yUnitSize = max / yAxisSections;
        if(yUnitSize < 1)
            yUnitSize = 1;
        
        StringBuffer buffer = new StringBuffer("");
        
        //draw the start of the table
        buffer.append("<table style='border:1px black solid;' cellspacing=0 cellpading=0>");
        
        //draw out labels / bars
        for(int i = 0; i < yAxisSections; i++) {
            buffer.append("<tr>");
            buffer.append("<td valign=center style='height:" + (graphAreaHeight / yAxisSections) + "px'>");
            buffer.append((String)yAxisLabels.get(i));
            buffer.append("</td>");
            
            if(i==0) {
                //draw out bars
                //divider
                buffer.append("<td style='height:" + graphAreaHeight + "px' rowspan='" + yAxisSections + "'><div style='width:1px;background:black;height:100%;'></div></td>");
                
                for(int j = 0; j < xAxisSections; j++) {
                    buffer.append("<td valign='bottom' rowspan='" + yAxisSections + "' style='height:" + graphAreaHeight + "px' align=center>");
                    //calc height based on value
                    int h = 0;
                    int b = ((Integer)barValues.get(j)).intValue();
                    if(b != 0) {
                        h = (b / yUnitSize) * (graphAreaHeight / yAxisSections) - ((graphAreaHeight / yAxisSections) / 2);
                    }
                    buffer.append("<div style='background:blue; width:" + barWidth + "px;height:" + h + "px'></div>");
                    buffer.append("</td>");
                    
                    buffer.append("<td valign='bottom' rowspan='" + yAxisSections + "' style='height:" + graphAreaHeight + "px' align=center>");
                    buffer.append("&nbsp;");
                    buffer.append("</td>");
                }
            }
            
            buffer.append("</tr>");
        }
        
        //corner / bottom bar
        buffer.append("<tr>");
        buffer.append("<td>");
        buffer.append("&nbsp;");
        buffer.append("</td>");                            
        buffer.append("<td colspan=" + (yAxisSections * 2) + ">");
        buffer.append("<div style='height:1px;width=100%;background:black;'></div>");
        buffer.append("</td>");
        buffer.append("</tr>");
        
        //labels
        buffer.append("<tr>");
        buffer.append("<td>");
        buffer.append("&nbsp;");
        buffer.append("</td>");
        buffer.append("<td>");
        buffer.append("&nbsp;");
        buffer.append("</td>");
        
        for(int i = 0; i < xAxisSections; i++) {
            buffer.append("<td valign='bottom' align='center' >");
            buffer.append((String)xAxisLabels.get(i));
            buffer.append("</td>");
            buffer.append("<td valign='bottom' style='width:10px'>");
            buffer.append("&nbsp;");
            buffer.append("</td>");
        }
        
        buffer.append("</tr>");
        
        buffer.append("</table>");

        try {
            pageContext.getOut().println(buffer.toString());
        } catch (IOException e) {
            throw new JspException(e.getMessage());
        }
        
        return SKIP_BODY;
    }
}
