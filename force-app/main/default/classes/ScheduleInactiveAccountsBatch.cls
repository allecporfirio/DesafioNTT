/**
 * @author: Alessandro Porfírio
 */

/*

- Run the following code on Debug Execute Anonymous Window to schedule this class

ScheduleInactiveAccountsBatch scheduler = new ScheduleInactiveAccountsBatch();
String schedule = '0 0 0,6,12,18 ? * MON-FRI';
String jobID = System.schedule('Inactive Account Verification', schedule, scheduler);

*/

global class ScheduleInactiveAccountsBatch implements Schedulable {
    
    global void execute(SchedulableContext sc) {
        Database.executeBatch(new InactiveAccountsBatch(), 200);
    }

}