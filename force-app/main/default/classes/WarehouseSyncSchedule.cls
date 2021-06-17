global class WarehouseSyncSchedule implements Schedulable{
global void execute(SchedulableContext sc) {
        //calling sync method of warehouse class
        WarehouseCalloutService.runWarehouseEquipmentSync();
    }
  }