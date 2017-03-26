configuration AzureCourseConfig
{
	Node WebServer
	{
		WindowsFeature IIS
		{
			Ensure					='Present'
			Name					='Web-Server'
			IncludeAllSubFeature 	=$true
		}	
		Group Developers
		{	
			Ensure					='Present'
			GroupName				='DevGroup'
		}
		Group Accountants
		{
			Ensure					='Absent'
			GroupName				='AcctGroup'
		}
		File DirectoryCreate
		{
			Ensure	="Present"
			Type	="Directory"
			DestinationPath	="C:\Users\Public\Document\MyDemo"
		}
		Log AfterDirectoryCreate
		{
			Message					='Directory create using DSC'
			DependsOn				='[File]DirectoryCreate'
		}
	}	
}	