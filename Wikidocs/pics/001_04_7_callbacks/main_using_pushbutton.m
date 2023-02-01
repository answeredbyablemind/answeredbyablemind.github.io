function main_using_pushbutton
figure('menub','no','Position',[400 400 300 120], ...
    'numbertitle','off', 'resize','off');
uicontrol('style','pushbutton', 'position', [100, 10, 100, 20],...
    'String', 'click me!',...
    'Callback',@button_callback);
end

function button_callback(src, event)
msgbox('Congratulations!');
end