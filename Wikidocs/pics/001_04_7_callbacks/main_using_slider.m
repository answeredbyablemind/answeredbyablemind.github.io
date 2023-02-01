function main_using_slider
figure('menub','no','Position',[400 400 300 120], ...
    'numbertitle','off', 'resize','off');
ax = axes('Position', [0.2, 0.3, 0.6, 0.6]);
h = plot(0,0,'o','MarkerSize', 10, 'MarkerFaceColor', lines(1), 'MarkerEdgecolor', 'none');
ax.Visible = 'off';

uicontrol('style','slider', 'position', [100, 10, 100, 20],...
    'String', 'click me!', 'min', 2, 'max', 30,'SliderStep',[0.1 0.2],'Value',10,...
    'Callback',{@slider_callback, h});
end

function slider_callback(src, event, h)
h.MarkerSize = src.Value;
end