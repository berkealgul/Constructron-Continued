global.registered_entities = global.registered_entities or {}
global.constructrons_count = global.constructrons_count or {}
global.stations_count = global.stations_count or {}

global.constructron_pathfinder_requests = {}
global.construct_queue = {}
global.deconstruct_queue = {}
global.upgrade_queue = {}
global.constructron_statuses = {}
global.job_bundles = {}

game.print('Constructron-Continued - All job queues have been cleared! Any jobs that were in progress will need to be removed and then readded to be built!')

for s, surface in pairs(game.surfaces) do 
    global.constructrons_count[surface.index] = 0
    global.stations_count[surface.index] = 0
end

for c, constructron in pairs(global.constructrons) do
    local registration_number = script.register_on_entity_destroyed(constructron)
    global.registered_entities[registration_number] = {name = "constructron", surface = entity.surface.index}
    global.constructrons_count[constructron.surface.index] = global.constructrons_count[constructron.surface.index] + 1
end

for s, station in pairs(global.service_stations) do
    local registration_number = script.register_on_entity_destroyed(station)
    global.registered_entities[registration_number] = {name = "service_station", surface = entity.surface.index}
    global.stations_count[constructron.surface.index] = global.stations_count[constructron.surface.index] + 1
end