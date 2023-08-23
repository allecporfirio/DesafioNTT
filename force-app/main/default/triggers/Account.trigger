trigger Account on Account (before insert, after insert, before update) {

    AccountTH accountTH = new AccountTH(
        Trigger.new, Trigger.oldMap
    );

    if(Trigger.isBefore && Trigger.isInsert) {
        accountTH.beforeInsert();
    }

    if(Trigger.isAfter && Trigger.isInsert) {
        accountTH.afterInsert();
    }

    if(Trigger.isBefore && Trigger.isUpdate) {
        accountTH.beforeUpdate();
    }

}