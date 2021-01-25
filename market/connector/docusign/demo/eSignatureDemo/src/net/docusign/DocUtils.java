package net.docusign;

import java.io.ByteArrayOutputStream;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Base64;

import org.apache.commons.io.IOUtils;
import org.apache.commons.lang3.StringUtils;
import org.eclipse.core.resources.IFile;
import org.eclipse.core.runtime.CoreException;

import com.docusign.esign.model.Document;

import ch.ivyteam.ivy.application.IProcessModelVersion;
import ch.ivyteam.ivy.scripting.objects.File;

public class DocUtils
{
  public static Document ofLocalFile(String path) throws IOException, CoreException
  {
    IProcessModelVersion pmv = IProcessModelVersion.current();
    IFile localFile = pmv.getProject().getFile(path);
    try(InputStream is = localFile.getContents())
    {
      return create(is, localFile.getName());
    }
  }
  
  public static Document ofIvyFile(File file) throws IOException, CoreException
  {   
    try(InputStream is = new FileInputStream(file.getJavaFile()))
    {
      return create(is, file.getName());
    }
  }    
  
  public static Document create(InputStream is, String docName) throws IOException
  {
    byte[] docBytes = read(is);
    String docBase64 = new String(Base64.getEncoder().encode(docBytes));
    
    Document document = new Document();
    document.setDocumentBase64(docBase64);
    document.setName(docName); // can be different from actual file name
    document.setFileExtension(StringUtils.substringAfterLast(docName, ".")); // many different document types are accepted
    document.setDocumentId("1"); // a label used to reference the doc
    return document;
  }

  private static byte[] read(InputStream is) throws IOException
  {
    try (ByteArrayOutputStream bos = new ByteArrayOutputStream())
    {
      IOUtils.copy(is, bos);
      return bos.toByteArray();
    }
  }
}
