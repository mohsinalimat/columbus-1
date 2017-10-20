import Foundation

extension DPlan
{
    //MARK: private
    
    private func connect(
        database:Database,
        stop:DPlanStop,
        lastStop:DPlanStop,
        completion:@escaping(() -> ()))
    {
        database.create
        { [weak self] (travel:DPlanTravel) in
            
            self?.connect(
                stop:stop,
                lastStop:lastStop,
                travel:travel,
                completion:completion)
        }
    }
    
    private func connect(
        stop:DPlanStop,
        lastStop:DPlanStop,
        travel:DPlanTravel,
        completion:@escaping(() -> ()))
    {
        travel.origin = lastStop
        travel.destination = stop
        
        completion()
    }
    
    //MARK: internal
    
    func connect(
        database:Database,
        stop:DPlanStop,
        completion:@escaping(() -> ()))
    {
        defer
        {
            stop.plan = self
        }
        
        guard
        
            let lastStop:DPlanStop = stops?.lastObject as? DPlanStop
        
        else
        {
            completion()
            
            return
        }
        
        connect(
            database:database,
            stop:stop,
            lastStop:lastStop,
            completion:completion)
    }
}
