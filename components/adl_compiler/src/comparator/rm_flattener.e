note
	component:   "openEHR ADL Tools"
	description: "Reference Model flattener."
	keywords:    "archetype, flattening"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2014- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class RM_FLATTENER

inherit
	EXCEPTIONS
		rename
			class_name as exception_class_name
		export
			{NONE} all;
			{ANY} deep_copy, deep_twin, is_deep_equal, standard_is_equal
		end

feature -- Access

	archetype: ARCHETYPE
		attribute
			create Result.default_create
		end

feature -- Commands

	execute (an_archetype: ARCHETYPE; an_rm_schema: BMM_SCHEMA)
			-- create with source (differential) archetype of archetype for which we wish to generate a flat archetype
		require
			Archetype_valid: an_archetype.is_valid and then an_archetype.is_flat
		local
			def_it: C_ITERATOR
		do
			archetype := an_archetype
			rm_schema := an_rm_schema

			create def_it.make (archetype.definition)
			def_it.do_all (agent rm_node_flatten_enter, agent rm_node_flatten_exit)
		end

feature {NONE} -- Implementation

	rm_schema: BMM_SCHEMA
			-- utility reference to RM schema used for validation & flattening
		attribute
			create Result
		end

	rm_node_flatten_enter (a_c_node: ARCHETYPE_CONSTRAINT; depth: INTEGER)
			-- copy existence and cardinality from reference model to node if it doesn't have them set; infer occurrences
		local
			rm_attr_desc: BMM_PROPERTY [BMM_TYPE]
		do
			if attached {C_ATTRIBUTE} a_c_node as ca and then attached ca.parent as att_co then
				rm_attr_desc := rm_schema.property_definition (att_co.rm_type_name, ca.rm_attribute_name)
				if ca.existence = Void then
					ca.set_existence (rm_attr_desc.existence)
				end
				if ca.is_multiple and ca.cardinality = Void then
					if attached {BMM_CONTAINER_PROPERTY} rm_attr_desc as cont_prop and then attached cont_prop.cardinality as card then
						ca.set_cardinality (create {CARDINALITY}.make (card))
					else -- should never get here
						raise ("rm_node_flatten_enter location #1")
					end
				end
			elseif attached {C_OBJECT} a_c_node as co then
				-- here the logic is a bit trickier: there is no such thing as 'occurrences' in the reference model
				-- so it is set from the enclosing attribute cardinality if a container, or set to RM existence if not a container
				if co.occurrences = Void and attached co.parent as att_ca and then attached att_ca.parent as att_co then
					co.set_occurrences (rm_schema.property_object_multiplicity (att_co.rm_type_name, att_ca.rm_attribute_name))
				end
			end
		end

	rm_node_flatten_exit (a_c_node: ARCHETYPE_CONSTRAINT; depth: INTEGER)
		do
		end

end


