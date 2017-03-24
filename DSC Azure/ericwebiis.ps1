Configuration ERICWEBIIS
{
    
  Import-DscResource -Module xWebAdministration
  Import-DscResource -Module xNetworking
  Import-DscResource -Module xSqlPs
  Import-DscResource -Module xDatabase
  #http://www.vexasoft.com/blogs/powershell/9561687-powershell-4-desired-state-configuration-enforce-ntfs-permissions
  Import-DscResource -Module NTFSPermission
 
  Node $AllNodes.NodeName 
  { 
     
 
    #Install the IIS Role 
    WindowsFeature IIS 
    { 
      Ensure = “Present” 
      Name = “Web-Server” 
    } 
 
    # Required for SQL Server 
    WindowsFeature installdotNet35 
    {             
        Ensure = "Present"
        Name = "Net-Framework-Core"
        Source = "\\neuromancer\Share\Sources_sxs\?Win2012R2"
    } 
 
    #Install ASP.NET 4.5 
    WindowsFeature ASP 
    { 
      Ensure = “Present” 
      Name = “Web-Asp-Net45” 
    } 