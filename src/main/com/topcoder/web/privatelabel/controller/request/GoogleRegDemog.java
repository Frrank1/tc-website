package com.topcoder.web.privatelabel.controller.request;

import com.topcoder.web.privatelabel.Constants;

public class GoogleRegDemog extends FullRegDemog {
    protected void setNextPage() {
        if (hasErrors()) {
            setNextPage(Constants.GOOGLE_REG_PAGE);
        } else {
            setNextPage(Constants.GOOGLE_REG_DEMOG_PAGE);
        }
        setIsNextPageInContext(true);
    }
}
