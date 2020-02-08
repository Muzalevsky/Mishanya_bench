size = 181;
x = -90:1:90;
fi = [];

for i = 1 : size
    fi(i) = real_angle_degree(x(i));
end

plot(x, fi)