package client.gen.test;

import org.eclipse.core.runtime.IProgressMonitor;

public class SystemOutProgressMonitor implements IProgressMonitor
{
  @Override
  public void beginTask(String name, int totalWork)
  {
    System.out.print(name);
    System.out.print(" ... ");
  }

  @Override
  public void done()
  {
    System.out.println("done");
  }

  @Override
  public void internalWorked(double work) 
  {}

  @Override
  public boolean isCanceled()
  {
    return false;
  }

  @Override
  public void setCanceled(boolean value) 
  {}

  @Override
  public void setTaskName(String name) 
  {
    System.out.println("task: "+name);
  }

  @Override
  public void subTask(String name)  
  {
  }

  @Override
  public void worked(int work)
  {
    System.out.print(".");
  }
}