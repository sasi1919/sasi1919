trigger account_trigger on Account (after update) {
    account_trigger_helper  acchelp = new account_trigger_helper();
    acchelp.accountupdate(Trigger.new,Trigger.newmap,Trigger.oldmap);
}