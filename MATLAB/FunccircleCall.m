% Calculates area of circle by first prompting user for radius

radius=input('Please enter the radius: ');
area=calcarea(radius);
fprintf('For a circle with radius %.2f,',radius)
fprintf(' the area is %.2f\n',area)