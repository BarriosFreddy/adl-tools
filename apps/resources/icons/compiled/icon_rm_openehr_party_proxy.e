note
	description: "Icon loader class generated by icondbc"
	keywords:    "Embedded icons"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2013- Ocean Informatics Pty Ltd"
	license:     "See notice at bottom of class"

class ICON_RM_OPENEHR_PARTY_PROXY

inherit
	ICON_SOURCE

create
	make

feature {NONE} -- Initialization

	make
			-- Initialization
		do
			key := "rm/openehr/party_proxy"
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
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) 
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) 
					A(00,00,00,00) A(70,33,46,5F) A(00,00,00,00) A(00,00,00,00) A(00,5C,5D,5C) A(04,FF,FF,FF) A(8B,49,48,47) A(A0,43,41,3F) A(84,5E,5C,5A) A(00,00,00,00) 
					A(00,9D,9D,9D) A(00,00,00,00) A(06,FF,FF,FF) A(85,43,65,8E) A(7F,44,69,94) A(7F,45,69,95) A(77,48,6E,9A) A(FF,2B,4B,72) A(8D,6E,7C,8D) A(00,00,00,00) 
					A(0F,FF,FF,FF) A(FA,22,20,1F) A(FE,25,22,20) A(FF,3F,3B,39) A(FF,55,51,4D) A(F9,58,56,53) A(04,FF,FF,FF) A(00,00,00,00) A(0B,FF,FF,FF) A(FF,39,5B,86) 
					A(FF,54,7B,AC) A(FF,54,7B,AB) A(FE,54,7A,AB) A(FF,51,77,A7) A(FF,33,57,84) A(9E,6E,7C,8E) A(80,60,35,1D) A(FE,22,1C,17) A(FF,13,15,19) A(FF,23,24,26) 
					A(FF,47,43,3F) A(FE,42,3E,3B) A(99,4C,4A,49) A(00,00,00,00) A(0C,FF,FF,FF) A(FF,2D,4C,72) A(FF,37,56,7D) A(FF,36,56,7D) A(FF,35,55,7C) A(FE,3D,60,8B) 
					A(FF,32,4A,67) A(2E,4D,65,7A) A(F7,97,55,39) A(FF,B1,5E,27) A(FF,D7,98,60) A(FF,EF,C4,97) A(FF,FF,D4,A7) A(FF,39,33,2E) A(B9,2A,28,26) A(00,00,00,00) 
					A(02,FF,FF,FF) A(3B,6F,85,A1) A(37,74,8A,A5) A(37,74,8A,A5) A(32,A3,B5,C9) A(FF,2D,43,60) A(36,63,6F,7B) A(00,00,00,00) A(FF,97,55,38) A(FE,A1,53,20) 
					A(FF,BA,79,42) A(FF,CD,96,65) A(FF,D7,A1,6D) A(FF,6B,4D,35) A(B3,3F,38,32) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) 
					A(00,00,00,00) A(47,64,74,84) A(00,00,00,00) A(00,00,00,00) A(86,9E,5B,3C) A(FF,9C,4A,1C) A(FF,A3,55,23) A(FF,AF,69,32) A(FF,B0,6B,34) A(FF,A6,57,26) 
					A(35,6E,71,75) A(00,96,96,96) A(00,00,00,00) A(89,91,91,91) A(FF,97,97,97) A(3F,6D,6D,6D) A(00,00,00,00) A(31,BA,BA,BA) A(54,67,67,67) A(00,00,00,00) 
					A(7D,BA,73,36) A(FF,A1,71,5B) A(FF,A2,4A,10) A(FF,98,44,15) A(FF,89,37,14) A(8D,BC,79,50) A(00,00,00,00) A(00,00,00,00) A(7D,8B,8B,8B) A(B8,96,96,96) 
					A(00,00,00,00) A(E6,7F,7F,7F) A(A6,6A,6A,6A) A(E2,6C,6C,6C) A(00,00,00,00) A(C5,A1,5D,29) A(FF,B8,4E,00) A(FF,BB,C7,CE) A(FF,58,50,B9) A(FF,C5,BC,BB) 
					A(FE,F8,CE,91) A(FF,F9,B4,58) A(94,EF,9A,3D) A(00,00,00,00) A(00,00,00,00) A(75,8F,8F,8F) A(E2,8D,8D,8D) A(06,38,38,38) A(22,D8,D8,D8) A(23,BB,BB,BB) 
					A(50,9A,8B,83) A(FF,92,3E,00) A(FE,CB,6E,18) A(FF,7C,7F,D1) A(FF,BB,BA,DE) A(FF,F2,CE,9F) A(FF,FC,AF,4B) A(FF,F8,AE,4D) A(FF,FD,A7,38) A(59,E1,98,4F) 
					A(84,80,80,80) A(B7,A3,A3,A3) A(11,96,96,96) A(FE,77,77,77) A(80,6E,6E,6E) A(F2,70,70,71) A(87,91,43,0A) A(FE,97,43,00) A(FF,CD,83,34) A(FF,14,13,AF) 
					A(FF,E0,CF,C1) A(FF,F5,8F,15) A(FF,EE,9D,39) A(FF,F3,9D,33) A(FF,FC,A7,39) A(CB,EF,9D,3E) A(1B,DB,DB,DB) A(73,8F,8F,8F) A(E3,8D,8D,8D) A(16,C1,C1,C1) 
					A(51,98,98,98) A(1F,C5,C7,C8) A(A3,8E,48,13) A(FF,83,38,01) A(FF,70,39,40) A(FF,0C,13,A6) A(FF,F4,81,07) A(FF,F8,88,0D) A(FF,F4,84,0B) A(FF,FA,95,1D) 
					A(FF,FA,98,23) A(FF,EC,8D,25) A(84,80,80,80) A(B9,A2,A2,A2) A(1B,93,93,93) A(FE,77,77,77) A(80,6E,6E,6E) A(F0,6F,6F,6F) A(A5,9F,7F,67) A(FE,7E,2F,00) 
					A(FE,5E,30,43) A(FF,81,43,3A) A(FF,C3,5D,01) A(FF,CB,63,01) A(FF,EE,78,01) A(FF,F5,80,04) A(FF,F4,7E,03) A(FF,E1,75,0A) A(25,C7,C7,C7) A(00,00,00,00) 
					A(00,93,93,93) A(02,FF,FF,FF) A(51,99,99,99) A(00,00,00,00) A(00,00,00,00) A(C4,97,80,6D) A(FF,76,39,22) A(FE,9B,41,00) A(FF,A1,49,00) A(FF,BE,5B,01) 
					A(FF,CB,62,02) A(FF,CF,65,02) A(FF,D0,66,01) A(FF,BE,6F,2C) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) 
					A(00,FB,FC,FB) A(00,00,00,00) A(35,BE,DC,E8) A(A6,96,78,5F) A(F6,9E,6D,46) A(FF,A2,65,30) A(FF,A4,60,26) A(FF,AA,6D,38) A(D5,AC,79,51) A(47,B8,C3,CA) 
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,FF,FF,FF) A(00,00,00,00) 
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,CF,DC,DF) ;
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