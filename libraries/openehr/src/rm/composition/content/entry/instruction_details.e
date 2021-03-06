note
	component:   "openEHR ADL Tools"

	description: "[
	              Details of Instruction causing an Action
				  ]"
	keywords:    "content, clinical, instruction, action, workflow"

	requirements:"ISO 18308 TS V1.0 ???"
	design:      "openEHR EHR Reference Model 5.0"

	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2005 The openEHR Foundation <http://www.openEHR.org>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"


class INSTRUCTION_DETAILS

inherit
	PATHABLE

feature -- Access

	instruction_id: LOCATABLE_REF
			-- id of Instruction

	activity_id: STRING
			-- Id of activity as an archetype path in Instruction

	wf_details: ITEM_STRUCTURE
			-- Various workflow engine state details, potentially including
			-- such things as:
			-- 	condition that fired to cause this Action to be done (with
			--  actual variables substituted); list of notifications which
			--  actually occurred (with all variables substituted);
			--  other workflow engine state.
			-- This specification does not currently define the actual
			-- structure or semantics of this field.

	path_of_item (a_loc: LOCATABLE): STRING
			-- The path to an item relative to the root of this archetyped structure.
		do
		end

	item_at_path (a_path: STRING): LOCATABLE
			-- The item at a path (relative to this item).
		do
		end

	parent: LOCATABLE
			-- parent node of this node in compositional structure
		do
		end

feature -- Status Report

	path_exists (a_path: STRING): BOOLEAN
			-- True if the path is valid with respect to the current item.
		do
		end

invariant
	Instruction_id_valid: instruction_id /= Void
	Activity_path_valid: activity_id /= Void and then not activity_id.is_empty

end


