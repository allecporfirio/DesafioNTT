/**
 * @author: Alessandro Porfírio
 */

public class AccountEnricher {

    OpportunityRepository opportunityRepository;
    TaskRepository taskRepository;

    public AccountEnricher() {
        this.opportunityRepository = new OpportunityRepository();
        this.taskRepository = new TaskRepository();
    }
    
    public void withRelatedOpportunities(List<Account> accounts) {

        List<Opportunity> opportunitiesToInsert = new List<Opportunity>();

        for(Account account : accounts) {

            OpportunityBuilder opportunityBuilder = new OpportunityBuilder();
            Opportunity opportunity = opportunityBuilder
                                            .withName(account.Name + ' – opp Parceiro')
                                            .withCloseDate(Date.today().addDays(30))
                                            .withStageName('Qualification')
                                            .build();
            opportunitiesToInsert.add(opportunity);

        }

        opportunityRepository.save(opportunitiesToInsert);

    }

    public void withRelatedTasks(List<Account> accounts) {

        List<Task> tasksToInsert = new List<Task>();

        for(Account account : accounts) {

            TaskBuilder taskBuilder = new TaskBuilder();
            Task task = taskBuilder
                            .withWhatId(account.Id)
                            .withStatus('Not Started')
                            .withPriority('Normal')
                            .withSubject('Consumidor Final')
                            .build();
            tasksToInsert.add(task);
            
        }

        taskRepository.save(tasksToInsert);

    }

}
