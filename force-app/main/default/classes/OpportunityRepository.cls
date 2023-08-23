/**
 * @author: Alessandro Porfírio
 */

public class OpportunityRepository {
    
    public List<Opportunity> save(List<Opportunity> opportunities) {
        upsert opportunities;
        return opportunities;
    }

}