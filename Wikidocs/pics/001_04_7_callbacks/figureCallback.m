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