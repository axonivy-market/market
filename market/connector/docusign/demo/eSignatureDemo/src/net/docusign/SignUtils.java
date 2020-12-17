package net.docusign;


import com.docusign.esign.model.SignHere;
import com.docusign.esign.model.Signer;
import com.fasterxml.jackson.databind.JsonNode;

import ch.ivyteam.ivy.security.ISession;
import ch.ivyteam.ivy.security.IUser;

public class SignUtils
{
  public static Signer signer(ISession session)
  {
    return signer(session.getSessionUser());
  }
  
  public static Signer myself(ISession session)
  {
    Signer me = new Signer();
    JsonNode userInfo = net.docusign.auth.UserUriFilter.readUserInfo(session);
    me.setName(userInfo.get("name").asText());
    me.setEmail(userInfo.get("email").asText());
    me.recipientId(Long.toString(session.getIdentifier()));
    return me;
  }

  public static Signer signer(IUser user)
  {
    Signer signer = new Signer();
    signer.recipientId(Long.toString(user.getId()));
    signer.setEmail(user.getEMailAddress());
    signer.setName(user.getFullName());
    return signer;
  }
  
  public static SignHere simple(String label)
  {
    SignHere signHere = new SignHere();
    signHere.setDocumentId("1");
    signHere.setPageNumber("1");
    signHere.setRecipientId("1");
    signHere.setTabLabel(label);
    signHere.setXPosition("10");
    signHere.setYPosition("10");
    return signHere;
  }
  
}
