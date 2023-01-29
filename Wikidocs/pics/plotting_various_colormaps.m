my_colormap_str = ["parula", "turbo", "hsv", "hot", "cool", "spring", ...
    "summer", "gray", "bone", "jet", "lines"];
close all;
figure('position', [780   105   706   792]);

for i_str = 1:length(my_colormap_str)
    subplot(length(my_colormap_str), 1, i_str)
    imagesc(1:256)
    colormap(gca, my_colormap_str(i_str));
    title(my_colormap_str(i_str))
    set(gca, 'ytick', [])
    set(gca,'xticklabel', {})
    set(gca,'XMinorTick','on')
    grid on
    grid minor
end

exportgraphics(gcf, 'default_colormaps.png')