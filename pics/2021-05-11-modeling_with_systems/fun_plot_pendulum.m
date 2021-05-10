
function fun_plot_pendulum(z, varargin)

params = inputParser;
params.CaseSensitive = false;

params.addParameter('isRecording', false);
params.addParameter('videoname', 'damped_motion');
params.parse(varargin{:});

isRecording = params.Results.isRecording;
videoname = params.Results.videoname;

if isRecording
    newVid = VideoWriter(videoname, 'MPEG-4');

    newVid.FrameRate = 20;
    newVid.Quality = 100;
    open(newVid);
end

global fig_dirfield
figure(fig_dirfield)

r = 1;
subplot(1,2,2);
set(gca,'visible','off');
xlim([-1, 1])
ylim([-1, 1])

for i = 1:length(z)
    subplot(1,2,2);
    theta = z(i, 1);
    line([0, r * sin(theta)], [0, -r * cos(theta)],'linewidth',2);
    hold on;
    plot(r*sin(theta), -r * cos(theta),'o','linewidth',2,'markerfacecolor',lines(1),'markeredgecolor','none');
    hold off;
    
    subplot(1,2,1);

    my_circ = plot(z(i,1), z(i,2),'o','markerfacecolor','r','markeredgecolor','k');
    
    if isRecording
            writeVideo(newVid, getframe(fig_dirfield))
    end
    
    pause(0.1);

    
    if i < length(z)
        subplot(1,2,2);
        cla
        subplot(1,2,1);

        delete(my_circ)
    end

end

if isRecording
    close(newVid)
end


end
