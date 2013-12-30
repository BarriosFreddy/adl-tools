note
	component:   "openEHR ADL Tools"
	description: "interface class to ADL parser and parse tree"
	keywords:    "ADL"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2003- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class CADL_14_ENGINE

inherit
	PARSER_ENGINE
		rename
			set_source as parser_set_source
		redefine
			tree, parser, assign_parser_result
		end

	SHARED_C_SERIALISERS
		export
			{NONE} all;
			{ANY} deep_copy, deep_twin, is_deep_equal, standard_is_equal, has_c_serialiser_format
		end

create
	make

feature {NONE} -- Initialisation

	make
		do
			create parser.make
		end

feature -- Access

	tree: detachable C_COMPLEX_OBJECT
			-- Set if parse succeeded.

feature -- Commands

	set_source (in_text: STRING; a_source_start_line: INTEGER; an_rm_schema: BMM_SCHEMA)
			-- Set `in_text' as working artifact.
		do
			parser_set_source (in_text, a_source_start_line)
			rm_schema := an_rm_schema
		end

	serialise (an_archetype: ARCHETYPE; a_format, a_lang: STRING)
			-- Serialise current artifact into `a_format'.
		require
			Format_valid: has_c_serialiser_format (a_format)
			Language_valid: an_archetype.has_language (a_lang)
		local
			a_c_iterator: OG_CONTENT_ITERATOR
		do
			if attached tree as att_tree and attached c_serialiser_for_format (an_archetype, a_lang, a_format) as a_c_serialiser then
				a_c_serialiser.initialise (an_archetype, a_lang)
				create a_c_iterator.make (att_tree.representation, a_c_serialiser)
				a_c_iterator.do_all
				a_c_serialiser.finalise
				serialised := a_c_serialiser.last_result
			end
		ensure
			serialised_attached: attached serialised
		end

feature {NONE} -- Implementation

	assign_parser_result
			-- override in descendants to get around limitations in gobo parsers not being able
			-- to be componentised
		do
			if attached {C_COMPLEX_OBJECT} parser.output as cco then
				tree := cco
			end
		end

	parser_execute
			-- call the parser.execute with specific args
		do
			if attached source as att_source and attached rm_schema as rms then
				parser.execute (att_source, source_start_line, rms)
			end
		end

	parser: CADL_14_PARSER

	rm_schema: detachable BMM_SCHEMA

end

