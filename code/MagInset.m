function MagInset(h, ax, ZoomArea, InsetPos, Lines)
    % ************ MagInset.m *************
    % * Created: January 1, 2015          *
    % * By: Damien Frost                  *
    % * Inspiration By: Robert Richardson *
    % *************************************
    % 
    % MagInset (Magnified Inset) places an axes inset into an existing 
    % figure with handle h. Re-size your figure and axes before running
    % MagInset.
    %
    % h - handle to a figure on which to place an inset
    %
    % ax - handle to an axes object. Set to -1 to use the default axes in the
    %      figure.
    %
    % ZoomArea - a 4x1 array which defines the zoom area that inset
    %            should have. It is of the form: 
    %                [xmin xmax ymin ymax]
    %            The values are NOT normalized values, but graph values. In
    %            this way, you can easily read off the zoom area you would like
    %            to specify.
    %
    % InsetPos - defines the position of the inset. It is of the form:
    %                [xmin xmax ymin ymax]
    %            The values are NOT normalized values, but graph values. In
    %            this way, you can easily read off the inset area you would
    %            like to specify
    %
    % Lines - defines a list of lines to connect the zoom area with the inset
    %         graph. It can be empty. It should be of the form:
    %             Lines = {'NW','SW'; 'NE','SE'};
    %         It can have as many rows as you wish
    %         The first colum is the corner of the Zoom Area. The second column is the
    %         corner of the Inset Axes

    BadInput = 0;
    axesObjs = get(h, 'Children');  %axes handles
    % Determine which axes the inset will be placed on:
    if(ax == -1)
        MainAx = axesObjs(end);
    else
        MainAx = -1;
        for ii=1:1:max(size(axesObjs))
            if(axesObjs(ii) == ax)
                MainAx = axesObjs(ii);
                break;
            end
        end
        if(MainAx == -1)
            % Could not find the desired axes:
            fprintf('\nMagInset Error: Could not find the desired axes in the figure.\n');
            BadInput = 1;
        end
    end

    if(BadInput == 0)

        % Get the plot data:
        dataObjs = get(MainAx, 'Children');

        % Annotation positions are of the form:
        % [x y length height]
        % And are normalized to the figure

        % Calculate the normalize rectangular coordinates for the zoom area:
        [zax, zay] = xy2norm(MainAx, ZoomArea(1:2), ZoomArea(3:4));

        % Create the rectangle around the area we are going to zoom into:
        annotation('rectangle',[zax(1) zay(1) (zax(2) - zax(1)) (zay(2) - zay(1))]);

        % Calculate the inset position in normalized coordinates;
        [ipx, ipy] = xy2norm(MainAx, InsetPos(1:2), InsetPos(3:4));

        if(nargin > 4)
            % Add the lines from the zoom area to the inset:
            numLine = size(Lines,1);
            if((numLine>0) && (size(Lines,2) == 2))
                lx = zeros(2,1);
                ly = zeros(2,1);
                for ii=1:1:numLine
                    jj = 1;
                    % Find the co-ordinate in the zoom area:
                    % y co-ordinates:
                    if(Lines{ii,jj}(1) == 'S')
                        ly(jj) = zay(1);
                    else
                        ly(jj) = zay(2);
                    end
                    % x co-ordinates:
                    if(Lines{ii,jj}(2) == 'W')
                        lx(jj) = zax(1);
                    else
                        lx(jj) = zax(2);
                    end

                    jj = 2;
                    % Find the co-ordinate in the inset axes:
                    % y co-ordinates:
                    if(Lines{ii,jj}(1) == 'S')
                        ly(jj) = ipy(1);
                    else
                        ly(jj) = ipy(2);
                    end
                    % x co-ordinates:
                    if(Lines{ii,jj}(2) == 'W')
                        lx(jj) = ipx(1);
                    else
                        lx(jj) = ipx(2);
                    end

                    % Add the line:
                    annotation('line', lx,ly);
                end
            end
        end

        % Add the second set of axes on the same plot:
        iaxes = axes('position', [ipx(1) ipy(1) (ipx(2) - ipx(1)) (ipy(2) - ipy(1))]);
        hold on;
        box on;
        % Add the plots from the original axes onto the inset axes:
        copyobj(dataObjs,iaxes);
        % set the limits on the new axes:
        xlim(ZoomArea(1:2));
        ylim(ZoomArea(3:4));

        % Our work here is done.
    end
end

function [xn, yn] = xy2norm(axh, x, y)
    % ********* xy2norm.m *********
    % * Created: January 1, 2015  *
    % * By: Damien Frost          *
    % *****************************
    % This function takes a point (x, y) and returns the normalized
    % co-ordinates (xn, yn) given the axes with handle axh.
    %
    % *** Modifications: ***
    % 1) Added 'axh = handle(axh);' line to make the script backwards
    % compatible with MATLAB R2013a (Perhaps further back) - Thanks Shi
    % Zhao!
    axh = handle(axh);
    % Save some temporary variables about the axes:
    axPos = axh.Position;
    xlims = axh.XLim;
    ylims = axh.YLim;
    % Calculate the normalized co-ordinates:
    xn = axPos(1) + axPos(3) .* (x-xlims(1))./(xlims(2) - xlims(1));
    yn = axPos(2) + axPos(4) .* (y-ylims(1))./(ylims(2) - ylims(1));
    % GTFO:
end