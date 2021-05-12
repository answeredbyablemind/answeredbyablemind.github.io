
function fun_plot_pendulum(z, varargin)

params = inputParser;
params.CaseSensitive = false;

params.addParameter('isRecording', false);
params.addParameter('videoname', 'damped_motion');
params.addParameter('getFigure', false);
params.addParameter('onlyPendulum', false);

params.parse(varargin{:});

isRecording = params.Results.isRecording;
videoname = params.Results.videoname;
getFigure = params.Results.getFigure;
onlyPendulum = params.Results.onlyPendulum;

if isRecording
    newVid = VideoWriter(videoname, 'MPEG-4');
    
    newVid.FrameRate = 20;
    newVid.Quality = 100;
    open(newVid);
end

if getFigure
    global fig_dirfield
    figure(fig_dirfield)
end


r = 1;
if ~onlyPendulum
    subplot(1,2,2);
end
set(gca,'visible','off');
xlim([-1, 1])
ylim([-1, 1])

for i = 1:length(z)
    if ~onlyPendulum
        subplot(1,2,2);
    end
    
    theta = z(i, 1);
    line([0, r * sin(theta)], [0, -r * cos(theta)],'linewidth',2);
    hold on;
    plot(r*sin(theta), -r * cos(theta),'o','linewidth',2,'markerfacecolor',lines(1),'markeredgecolor','none');
    hold off;
    
    if ~onlyPendulum
        
        subplot(1,2,1);
        
        my_circ = plot(z(i,1), z(i,2),'o','markerfacecolor','r','markeredgecolor','k');
    end
    if isRecording
        writeVideo(newVid, getframe(gcf))
    end
    
    pause(0.1);
    
    
    if i < length(z)
        if ~onlyPendulum
            subplot(1,2,2);
            cla
            subplot(1,2,1);
            delete(my_circ)
        else
            cla;
        end
    end
    
end

if isRecording
    close(newVid)
end


end
