

# create a hash to hold all our lines  ( just neater )

mta = {

	n: ["Times Square" , "34th" , "28th-n" , "23rd-n", "Union Square" , "8th-n"],
	six:["Grand Central" , "33rd" , "28th-s" , "23rd-s" , "Union Square" , "Astor Place"],
	l: ["8th-l" , "6th" , "Union Square" , "3rd", "1st" ]

}


# get the start position from the user ( don't forget to convert to a symbol with to_sym )
puts("Which line are you starting on? n,six or l");
start_line = gets().chomp().to_sym();

# now use that line to show them which stations are available
line_string = mta[start_line].join(",");
puts("Which station are you at? #{line_string}");
start_station = gets().chomp();

# get the end position from the user
puts("Which line are you going to? n,six or l");
end_line = gets().chomp().to_sym();

# now use that line to show them which stations are available
line_string = mta[end_line].join(",");
puts("Which station are you going to? #{line_string}");
end_station = gets().chomp();

# get the intersection ( use first becuase it's the only one )
intersection = (mta[start_line] & mta[end_line]).first;

# get the starting and ending station index
start_line_start_index = mta[start_line].index(start_station);
end_line_start_index = mta[end_line].index(end_station);


# if there on the same line we dont need to worry about the intersection ( Thanks Stu and Donna )
if(start_line == end_line)

	# now add them together and print them out ( with some lovely interpolation )
	total_stops = (start_line_start_index - end_line_start_index).abs;

# otherwise we need to count the intersections and other lines stop
else

	# get the index of start and finish in each array ( that will tell us how far to go in stops )
	start_line_intersection_index = mta[start_line].index(intersection);

	# doesn't matter which index is bigger because if we remove the negative ( minus sign ) with abs the answer will be the same
	stops_on_start_line = (start_line_intersection_index - start_line_start_index).abs;

	# repeat for the end line
	end_line_intersection_index = mta[end_line].index(intersection);

	# same here
	stops_on_end_line = (end_line_intersection_index - end_line_start_index).abs;

	# now add them together and print them out ( with some lovely interpolation )
	total_stops = stops_on_end_line + stops_on_start_line;
	puts("You need to go #{total_stops} stops!");

end


# output the result
puts("You need to go #{total_stops} stops!");


