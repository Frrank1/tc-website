/*
 * Created on Jan 24, 2006
 */
package com.topcoder.web.forums.controller.request;

import com.jivesoftware.forum.ForumMessage;
import com.jivesoftware.forum.RatingManager;
import com.jivesoftware.forum.RatingManagerFactory;
import com.topcoder.web.forums.ForumConstants;
import com.topcoder.web.forums.controller.ForumsUtil;

import java.util.Iterator;

/**
 * @author mtong
 *
 * Provides processing related to the rating of messages. As of version 4.*, Jive's rating system
 * only supports positive integers as rating scores. 1 point is assigned to each negative rating 
 * and 2 points to each positive rating. Users can toggle between positive, neutral, and negative ratings.
 */
public class Rating extends ForumsProcessor {
    protected void businessProcessing() throws Exception {
        super.businessProcessing();
        if (authToken.isAnonymous()) return;
        RatingManager ratingManager = RatingManagerFactory.getInstance(authToken); 
        if (!ratingManager.isRatingsEnabled()) return;
        
        long messageID = Long.parseLong(getRequest().getParameter(ForumConstants.MESSAGE_ID));
        int voteValue = Integer.parseInt(getRequest().getParameter("voteValue"));
        ForumMessage message = forumFactory.getMessage(messageID);
        
        // users cannot rate their own posts
        if (!user.equals(message.getUser())) {
            ratingManager.addRating(user, message, ratingManager.getRatingFromScore(voteValue)); 
        }
        
        int posRatings = 0;
        int negRatings = 0;
        
        Iterator itRatings = ratingManager.getRatings(message);
        while (itRatings.hasNext()) {
            com.jivesoftware.forum.Rating rating = (com.jivesoftware.forum.Rating)itRatings.next();
            int score = rating.getScore();
            switch (score) {
                case 1:
                    negRatings++;
                    break;
                case 2:
                    posRatings++;
                    break;
            }
        }
        
        getResponse().setContentType("text/xml");
        getResponse().addHeader("Cache-Control", "no-cache");
        getResponse().getOutputStream().write(ForumsUtil.asciiGetBytes
                (getXML(messageID, posRatings, negRatings)));
        getResponse().flushBuffer();
    }
    
    private String getXML(long messageID, int posRatings, int negRatings) {
        String xml = "<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"yes\"?>\n" +
            "<response>\n" +
                "<messageID>"+messageID+"</messageID>\n" +
                "<posRatings>"+posRatings+"</posRatings>\n" + 
                "<negRatings>"+negRatings+"</negRatings>\n" +
            "</response>";
        return xml;
    }
}