/*
 * TCO04ContestDetails.java
 *
 * Created on August 5, 2004, 12:24 PM
 */

package com.topcoder.web.tc.controller.request.development;

import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.dataAccess.resultSet.*;
import com.topcoder.shared.dataAccess.*;

import com.topcoder.web.tc.model.TCO04OverallResult;

import java.util.*;
import java.text.DecimalFormat;
/**
 *
 * @author  rfairfax
 */
public class TCO04ContestDetailsOverall extends StatBase {
    
    
    String getCommandName() {
        return "tco04_contest_details_overall";
    }
    
    String getDataSourceName() {
        return DBMS.TCS_OLTP_DATASOURCE_NAME;
    }
    
    String getPageName() {
        return "/tournaments/tco04/contest_det_overall.jsp";
    }
    
    void statProcessing()  {
        Map result2 =  (Map)getRequest().getAttribute("resultMap");

        ResultSetContainer rsc = (ResultSetContainer)result2.get("tco04_contest_results_overall");
        
        ArrayList arr = new ArrayList();
        
        DecimalFormat dfmt = new DecimalFormat("$#,##0.00");
        
        for(int i = 0; i < rsc.size(); i++)
        {
            Request dataRequest = new Request();
            dataRequest.setContentHandle("tco04_user_details"); 
            dataRequest.setProperty("ct", getRequest().getParameter("ct"));
            dataRequest.setProperty("uid", String.valueOf( rsc.getIntItem(i, "user_id")));
            
            DataAccessInt dai = getDataAccess(getDataSourceName(), true);
            Map result = dai.getData(dataRequest);
            
            ResultSetContainer rscDetails = (ResultSetContainer)result.get("tco04_overall_details");
            
            //build points
            int pts = 0;
            boolean pending = false;
            for(int j = 0; j < rscDetails.size(); j++)
            {
                if(rscDetails.getIntItem(j, "complete_status") == 0)
                    pending = true;
                
                pts += rscDetails.getIntItem(j, "position_points");
            }
            
            String prz = "";
            if(rsc.getIntItem(i, "prize_payment") != 0) {
                prz = dfmt.format(rsc.getDoubleItem(i, "prize_payment"));
                
            }
            arr.add( new TCO04OverallResult(rsc.getStringItem(i, "handle"), pending, pts, 
                rsc.getIntItem(i, "complete_count"), rsc.getIntItem(i, "incomplete_count"), 
                rsc.getIntItem(i, "user_id"), prz) );
        }

        Collections.sort(arr, new myComparator());
        
        getRequest().setAttribute("results", arr);
        
    }   
    
    public class myComparator implements Comparator {
            
        public int compare(Object o1, Object o2) {
            TCO04OverallResult a1 = (TCO04OverallResult)o1;
            TCO04OverallResult a2 = (TCO04OverallResult)o2;
            
            return a1.getPoints() - a2.getPoints();
        }
        
    }
}
