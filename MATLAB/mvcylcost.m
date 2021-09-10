function outcost=cylcost(radius,height,sqft_cost)
% Calculates cost of constructing a closed cylinder.
% Radius and height are in inches, unit cost is in square feet.

% Calculate surface area in square inches
surf_area=2*pi*radius.*height+2*pi*radius.^2;

% Convert surface area to square feet and round up
surf_areasf=ceil(surf_area/144);

% Calculate total cost
outcost=surf_areasf.*sqft_cost;

fprintf('The cost would be $%.2f\n',outcost)