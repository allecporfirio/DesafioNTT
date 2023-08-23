/**
 * @author: Alessandro Porfírio
 */

public class OpportunityBuilder {

    Opportunity opportunity;

    public OpportunityBuilder() {
        this.opportunity = new Opportunity();
    }

    public OpportunityBuilder withName(String name) {
        this.opportunity.Name = name;
        return this;
    }

    public OpportunityBuilder withCloseDate(Date closeDate) {
        this.opportunity.CloseDate = closeDate;
        return this;
    }

    public OpportunityBuilder withStageName(String stageName) {
        this.opportunity.StageName = stageName;
        return this;
    }

    public Opportunity build() {
        return this.opportunity;
    }

}