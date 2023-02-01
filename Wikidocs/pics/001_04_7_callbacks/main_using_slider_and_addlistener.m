function main_using_slider_and_addlistener()
a = -pi : pi/2 : pi;                                % Define Corners
ph = pi/4;                                          % Define Angular Orientation (‘Phase’)
x = [cos(a+ph); cos(a+ph)]/cos(ph);
y = [sin(a+ph); sin(a+ph)]/sin(ph);
z = [-ones(size(a)); ones(size(a))];
figure
surf(x, y, z, 'FaceColor','g')                      % Plot Cube
hold on
patch(x', y', z', 'r')                              % Make Cube Appear Solid
hold off
axis([ -1  1    -1  1    -1  1]*1.5)
grid on

view(3);


% slider
set(gcf,'position',[410 150 560 500]);
figsize= get(gcf,'position');
Slider1 = uicontrol('style','slider','position',[figsize(3)-20, 20 20 figsize(4)-20],...
    'min', 30, 'max', 330,'SliderStep',[0.1 1],'Value',30);

Slider2 = uicontrol('style','slider','position',[figsize(3)*0, figsize(4)*0 560 20],...
    'min', -37.5, 'max', 360-37.5,'SliderStep',[0.1, 1],'Value',-37.5);

addlistener(Slider1, 'Value','PostSet',@callbackfn_slider1);
addlistener(Slider2, 'Value','PostSet',@callbackfn_slider2);

end

function callbackfn_slider1(~, eventdata)
[az,~]=view;
el = get(eventdata.AffectedObject, 'Value');
view([az,el]);
grid on;
end

function callbackfn_slider2(~, eventdata)
[~,el]=view;
az = get(eventdata.AffectedObject, 'Value');
view([az,el]);
end
