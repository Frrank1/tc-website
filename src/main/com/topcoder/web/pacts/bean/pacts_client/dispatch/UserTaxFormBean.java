/**
 * this class is used to get all tax form information for a user from
 * the database.
 *
 * @author Sam King
 */

package com.topcoder.web.pacts.bean.pacts_client.dispatch;

import java.util.*;
import org.apache.log4j.Category;

import com.topcoder.web.pacts.common.*;
import com.topcoder.web.pacts.bean.*;
//import com.topcoder.web.stat.common.*;

import org.apache.log4j.*;
public class UserTaxFormBean implements PactsConstants {
    private static Category log = Category.getInstance(UserTaxFormBean.class.getName());

    /**
     * constructor. does nothing, statless class
     */
    public UserTaxFormBean() {
	// do nothing
    }

    /**
     * used to get the tax form for a specific tax form
     *
     * @param taxId the id of the tax form
     * @return the tax form, or null if the tax form id is invalid
     */
    public TaxForm getUserTaxForm(long taxId,long memberId) {
	log.debug("getUserTaxForm, taxFormID = " + taxId + " memberId = " +
		  memberId);
	DataInterfaceBean bean = new DataInterfaceBean();
	java.util.Map reply = null;
	try {
	    reply = bean.getUserTaxForm(memberId,taxId);
	} catch (Exception e1) {
	    log.error("did not get tax form in getUserTaxForm");
	    e1.printStackTrace();
	    return null;
	}

	log.debug(reply);

	TaxForm tf = new TaxForm(reply);

	return tf;
    }

    /**
     * used to find all tax forms for a specific member
     *
     * @param memberId the member id
     * @return an array of tax form headers for the user, or null if there
     *         are none or the member id is invalid.
     */
    public TaxFormHeader[] getTaxFormsForUser(int memberId) {
	log.debug("getTaxFormsForUser, memberId = " + memberId);
	DataInterfaceBean bean = new DataInterfaceBean();
	java.util.Map reply = null;
	try {
	    reply = bean.getUserTaxFormList(memberId);
	} catch (Exception e1) {
	    log.error("did not get tax form list in getTaxFormsForUser");
	    e1.printStackTrace();
	    return null;
	}

	TaxFormHeaderList tflist = new TaxFormHeaderList(reply);

	return tflist.headerList;
    }

    /**
     * the actual text of the tax form
     *
     * @param taxFormId the tax form id
     * @return the actual text of the tax form
     */
    public String getTaxFormText(long taxFormId) {
	log.debug("getTaxFormText, taxFormId = " + taxFormId);
	DataInterfaceBean bean = new DataInterfaceBean();
	String text = new String("");
	
	try {
	    Map results = bean.getText(taxFormId, TAX_FORM_OBJ);
	    ResultText t = new ResultText(results);
	    text = t.text;
	} catch(Exception e) {
	    log.error("we got excepted trying to get the tax form text" +
		      "for tax form " + taxFormId);
	    e.printStackTrace();
	}

	return text;
    }

    /**
     * exctracts the tax form object and the text for that form for a user
     *
     * @param taxFormId the tax form id
     * @param memberId the id of the member
     * @return the object that holds the tax form object and the text
     */
    public TaxFormWithText getTaxFormWithText(long taxFormId,long memberId) {
	log.debug("getTaxFormWithText, taxFormId = " + taxFormId);
	TaxFormWithText tf = new TaxFormWithText();
	
	tf.taxForm = getUserTaxForm(taxFormId, memberId);
	tf.text = getTaxFormText(taxFormId);

	return tf;
    }
}

  
