package com.topcoder.web.email.bean;

import com.topcoder.web.email.servlet.*;

import java.io.*;
import java.util.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.naming.*;

import com.topcoder.shared.ejb.EmailServices.*;
import com.topcoder.shared.util.logging.Logger;

/**
 * Task bean to collect login information
 *
 * @author    Eric Ellingson
 * @version   1.0
 *
 */

public class LoginTask
    implements Task, Serializable
{
    private static Logger log = Logger.getLogger(LoginTask.class);

    public TaskRouter perform(HttpServlet servlet,
                HttpServletRequest request,
                HttpServletResponse response)
        throws IOException, ServletException
    {
        // redirect to the main menu
        return new TaskRouter(EmailConstants.LOGIN_PAGE);
    }
}
