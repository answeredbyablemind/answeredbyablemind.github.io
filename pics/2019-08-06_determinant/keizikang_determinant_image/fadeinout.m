
function fadeinout(objs, inout, options)
arguments
    objs
    inout
    options.anim_Nsteps = 30
    options.t_pause = 0.003
end

for alpha = linspace(0, 1, options.anim_Nsteps)
    for i = 1:length(objs)
        switch objs(i).Type
            case 'patch'
                objs(i).FaceAlpha = (inout(i)==1)*alpha + (inout(i)==0)*(1-alpha);
                objs(i).EdgeAlpha = (inout(i)==1)*alpha + (inout(i)==0)*(1-alpha);
            case 'constantline'
                objs(i).Alpha = (inout(i)==1)*alpha + (inout(i)==0)*(1-alpha);
        end                
        pause(options.t_pause)
    end
end

end
