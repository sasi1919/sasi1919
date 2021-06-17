public class NewCaseListController
{
public List<Case> getNewCases()
{
List<case> caselist = [select Id,CaseNumber from case where status = 'New']; 
return caselist ;
}
}