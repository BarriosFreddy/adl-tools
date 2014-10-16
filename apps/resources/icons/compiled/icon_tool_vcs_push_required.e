note
	description: "Icon loader class generated by icon_code_gen"
	keywords:    "Embedded icons"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2013- Ocean Informatics Pty Ltd"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class ICON_TOOL_VCS_PUSH_REQUIRED

inherit
	ICON_SOURCE

create
	make

feature {NONE} -- Initialization

	make
			-- Initialization
		do
			key := "tool/vcs_push_required"
			make_with_size (16, 16)
			fill_memory
		end

feature {NONE} -- Image data
	
	c_colors_0 (a_ptr: POINTER; a_offset: INTEGER)
			-- Fill `a_ptr' with colors data from `a_offset'.
		external
			"C inline"
		alias
			"{
				{
					#define B(q) #q
					#ifdef EIF_WINDOWS
						#define A(a,r,g,b) B(\x##b\x##g\x##r\x##a)
					#else
						#define A(a,r,g,b) B(\x##r\x##g\x##b\x##a)
					#endif

					char l_data[] =
					A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,FF,FF,85) A(FF,FF,86,00) A(FF,FF,86,00) A(FF,FF,86,00) A(FF,FF,86,00) A(FF,FF,86,00) A(FF,FF,86,00) A(FF,FF,86,00) 
					A(FF,FF,86,00) A(FF,FF,86,00) A(FF,FF,86,00) A(FF,FF,FF,69) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,FF,FF,85) A(FF,FF,86,00) 
					A(FF,FF,86,00) A(FF,FF,86,00) A(FF,FF,86,00) A(FF,FF,86,00) A(FF,FF,86,00) A(FF,FF,86,00) A(FF,FF,86,00) A(FF,FF,86,00) A(FF,FF,86,00) A(FF,FF,FF,69) 
					A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,FF,FF,85) A(FF,FF,86,00) A(FF,FF,86,00) A(FF,FF,86,00) A(FF,FF,86,00) A(FF,FF,86,00) 
					A(FF,FF,86,00) A(FF,FF,86,00) A(FF,FF,86,00) A(FF,FF,86,00) A(FF,FF,86,00) A(FF,FF,FF,69) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,FF,FF,FF) 
					A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,FF,FF,FF) 
					A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,FF,FF,FF) 
					A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,FF,FF,FF) 
					A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,FF,FF,40) A(FF,FF,FD,25) A(FF,FF,FF,FF) 
					A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,FF,FF,FF) 
					A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,FF,FF,5B) A(FF,FF,8C,00) A(FF,FF,87,00) A(FF,FF,FF,44) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,FF,FF,FF) 
					A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,FF,FF,71) A(FF,FF,98,00) A(FF,FF,86,00) 
					A(FF,FF,86,00) A(FF,FF,8E,00) A(FF,FF,FF,5E) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,FF,FF,FF) 
					A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,FF,FF,81) A(FF,FF,A9,00) A(FF,FF,86,00) A(FF,FF,86,00) A(FF,FF,86,00) A(FF,FF,86,00) A(FF,FF,9A,00) A(FF,FF,FF,73) 
					A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,FF,FF,8B) A(FF,FF,C0,00) A(FF,FF,86,00) 
					A(FF,FF,86,00) A(FF,FF,86,00) A(FF,FF,86,00) A(FF,FF,86,00) A(FF,FF,86,00) A(FF,FF,AC,00) A(FF,FF,FF,82) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,FF,FF,FF) 
					A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,FF,FF,8F) A(FF,FF,DD,05) A(FF,FF,86,00) A(FF,FF,86,00) A(FF,FF,86,00) A(FF,FF,86,00) A(FF,FF,86,00) A(FF,FF,86,00) 
					A(FF,FF,86,00) A(FF,FF,86,00) A(FF,FF,C4,00) A(FF,FF,FF,8C) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,FF,FF,FF) 
					A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,FF,8D,00) A(FF,FF,86,00) A(FF,FF,86,00) A(FF,FF,86,00) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,FF,FF,FF) 
					A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,FF,8D,00) A(FF,FF,86,00) 
					A(FF,FF,86,00) A(FF,FF,86,00) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,FF,FF,FF) 
					A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,FF,8D,00) A(FF,FF,86,00) A(FF,FF,86,00) A(FF,FF,86,00) A(FF,FF,FF,FF) A(FF,FF,FF,FF) 
					A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,FF,FF,FF) 
					A(FF,FF,8D,00) A(FF,FF,86,00) A(FF,FF,86,00) A(FF,FF,86,00) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,FF,FF,FF) 
					A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,FF,8D,00) A(FF,FF,86,00) A(FF,FF,86,00) A(FF,FF,86,00) 
					A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,FF,FF,FF) ;
					memcpy ((EIF_NATURAL_32 *)$a_ptr + $a_offset, &l_data, sizeof l_data - 1);
				}
			}"
		end

	build_colors (a_ptr: POINTER)
			-- Build `colors'
		do
			c_colors_0 (a_ptr, 0)
		end

end