/*
 * Preferences.java
 *
 * Created on October 1, 2004, 1:49 PM
 */

package com.topcoder.web.tc.controller.request.contracting;

import com.topcoder.web.tc.model.ContractingInfo;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.tc.Constants;

import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.*;

import com.topcoder.web.tc.model.PreferenceGroup;
import com.topcoder.web.tc.model.Preference;

import java.util.*;
/**
 *
 * @author  rfairfax
 */
public class Preferences extends ContractingBase {
    protected void contractingProcessing() throws TCWebException {
        try {
        //load preference groups
        ArrayList groups = new ArrayList();
        
        Request r = new Request();
        r.setContentHandle("preference_groups");
        
        ResultSetContainer rsc = (ResultSetContainer)getDataAccess().getData(r).get("preference_groups");
        for(int i = 0; i < rsc.size(); i++) {
            PreferenceGroup grp = new PreferenceGroup();
            
            grp.setName(rsc.getStringItem(i, "preference_group_desc"));
            grp.setSortOrder(rsc.getIntItem(i, "sort_order"));
            
            //load preferences here
            Request rpref = new Request();
            rpref.setContentHandle("preferences_by_group");
            rpref.setProperty("prid", String.valueOf(rsc.getIntItem(i, "preference_group_id")));
            
            ResultSetContainer rscPref = (ResultSetContainer)getDataAccess().getData(rpref).get("preferences_by_group");
            for(int j = 0; j < rscPref.size(); j++) {
                Preference pref = new Preference();
                
                pref.setSortOrder(rscPref.getIntItem(j, "sort_order"));
                pref.setText(rscPref.getStringItem(j, "preference_desc"));
                pref.setType(rscPref.getIntItem(j, "preference_type_id"));
                
                grp.addPreference(pref);
            }
            
            
            groups.add(grp);
        }
        
        //sort groups by sort order
        Collections.sort(groups); 
        
        //set attribute with groups
        getRequest().setAttribute("groups", groups);
        } catch(TCWebException tce) {
            throw tce;
        } catch(Exception e) {
            throw new TCWebException(e);
        }
    }

    protected void setDefaults(ContractingInfo info) {
    }

    protected void setNextPage() {
        setNextPage(Constants.CONTRACTING_PREFERENCES_PAGE); 
        setIsNextPageInContext(true);
    }

    protected ContractingInfo updateContractingInfo(ContractingInfo info) {
        return info;
    }
    
    
}
