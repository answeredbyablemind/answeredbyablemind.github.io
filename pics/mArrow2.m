
function [ h ] = mArrow2(x1,y1,x2,y2,props,varargin)

params = inputParser;
params.CaseSensitive = false;
params.addParameter('arrow_type', 'arrow'); % doublearrowµµ °¡´É

params.parse(varargin{:});
%Extract values from the inputParser
arrow_type = params.Results.arrow_type;

h = annotation(arrow_type);

if strcmp(arrow_type,'arrow')
    set(h,'parent', gca, ...
        'position', [x1,y1,x2-x1,y2-y1], ...
        'HeadLength', 10, 'HeadWidth', 7, 'HeadStyle', 'cback1', ...
        props{:} );
elseif strcmp(arrow_type,'doublearrow')
    set(h,'parent', gca, ...
        'position', [x1,y1,x2-x1,y2-y1], ...
        'HeadStyle', 'cback1', ...
        props{:} );
end

    
end
