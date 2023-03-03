
function patch_slide(obj, x_dist, y_dist, options)
arguments
    obj
    x_dist
    y_dist
    options.anim_Nsteps = 30
    options.t_pause = 0.003
end

dx = x_dist/options.anim_Nsteps;
dy = y_dist/options.anim_Nsteps;
for i=1:options.anim_Nsteps
    obj.XData = obj.XData + dx(:);
    obj.YData = obj.YData + dy(:);
    obj.UserData.Position(1) = mean(obj.XData);
    obj.UserData.Position(2) = mean(obj.YData);
    pause(options.t_pause)
end

end