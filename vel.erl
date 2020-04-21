-module(vel).
-export([fall_velocity/2]).

fall_velocity(Planemo, Distance) ->
    Gravity = case Planemo of
        earth when Distance >= 0 -> 9.8;
        moon when Distance >= 0 -> 1.6;
        mars when Distance >= 0 -> 3.71
    end,
Velocity=math:sqrt(2 * Gravity * Distance),
if
    Velocity== 0 -> 'stable';   
    Velocity< 5 -> 'slow';
    Velocity>= 5, Velocity < 10 -> 'moving';
    Velocity>= 10, Velocity < 20 -> 'fast';
    Velocity>= 20 -> 'speedy'
end.
