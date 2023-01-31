function main_figureCallback()

figure(WindowKeyPressFcn=@figureCallback);
plot(1:10)

end

function figureCallback(src,event)
line = findobj(src,"Type","Line");
if event.Character == "+"
    disp("keyboard typed: '+'")
    line.LineWidth = line.LineWidth+1;
elseif event.Character == "-"
    disp("keyboard typed: '-'")
    line.LineWidth = max(line.LineWidth-1,0.5);
end
end