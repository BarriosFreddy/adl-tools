indexing
	component:   "openEHR Archetype Project"
	description: "[
				 Archetype cross-reference table validator. The ARCHEYPE class has a number of
				 xref tables it uses to keep track of the codes in the ontology and where they
				 are used in the archetype definition; these tables are used to test validity,
				 e.g. if a code is mentioned in the definition but not defined in the ontology
				 etc. This object is used in a traversal to populate the xref tables.
		         ]"
	keywords:    "visitor, constraint model"
	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2007 Ocean Informatics Pty Ltd"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

deferred class C_XREF_VALIDATOR

inherit
	C_VISITOR
		rename
			initialise as initialise_visitor
		end

feature -- Initialisation

	initialise(an_ontology: ARCHETYPE_ONTOLOGY) is
			-- set ontology required for interpreting meaning of object nodes
		require
			Ontology_valid: an_ontology /= Void
		do
			ontology := an_ontology
		end

feature -- Modification

	start_c_complex_object(a_node: C_COMPLEX_OBJECT; depth: INTEGER) is
			-- enter an C_COMPLEX_OBJECT
		deferred
		end

	end_c_complex_object(a_node: C_COMPLEX_OBJECT; depth: INTEGER) is
			-- exit an C_COMPLEX_OBJECT
		deferred
		end

	start_archetype_slot(a_node: ARCHETYPE_SLOT; depth: INTEGER) is
			-- enter an ARCHETYPE_SLOT
		deferred
		end

	end_archetype_slot(a_node: ARCHETYPE_SLOT; depth: INTEGER) is
			-- exit an ARCHETYPE_SLOT
		deferred
		end

	start_c_attribute(a_node: C_ATTRIBUTE; depth: INTEGER) is
			-- enter an C_ATTRIBUTE
		deferred
		end

	end_c_attribute(a_node: C_ATTRIBUTE; depth: INTEGER) is
			-- exit an C_ATTRIBUTE
		deferred
		end

	start_archetype_internal_ref(a_node: ARCHETYPE_INTERNAL_REF; depth: INTEGER) is
			-- enter an ARCHETYPE_INTERNAL_REF
		deferred
		end

	end_archetype_internal_ref(a_node: ARCHETYPE_INTERNAL_REF; depth: INTEGER) is
			-- exit an ARCHETYPE_INTERNAL_REF
		deferred
		end

	start_constraint_ref(a_node: CONSTRAINT_REF; depth: INTEGER) is
			-- enter a CONSTRAINT_REF
		deferred
		end

	end_constraint_ref(a_node: CONSTRAINT_REF; depth: INTEGER) is
			-- exit a CONSTRAINT_REF
		deferred
		end

	start_c_primitive_object(a_node: C_PRIMITIVE_OBJECT; depth: INTEGER) is
			-- enter an C_PRIMITIVE_OBJECT
		deferred
		end

	end_c_primitive_object(a_node: C_PRIMITIVE_OBJECT; depth: INTEGER) is
			-- exit an C_PRIMITIVE_OBJECT
		deferred
		end

	start_c_domain_type(a_node: C_DOMAIN_TYPE; depth: INTEGER) is
			-- enter an C_DOMAIN_TYPE
		deferred
		end

	end_c_domain_type(a_node: C_DOMAIN_TYPE; depth: INTEGER) is
			-- exit an C_DOMAIN_TYPE
		deferred
		end

	start_c_code_phrase(a_node: C_CODE_PHRASE; depth: INTEGER) is
			-- enter an C_CODE_PHRASE
		deferred
		end

	end_c_code_phrase(a_node: C_CODE_PHRASE; depth: INTEGER) is
			-- exit an C_CODE_PHRASE
		deferred
		end

	start_c_ordinal(a_node: C_DV_ORDINAL; depth: INTEGER) is
			-- enter an C_DV_ORDINAL
		deferred
		end

	end_c_ordinal(a_node: C_DV_ORDINAL; depth: INTEGER) is
			-- exit an C_DV_ORDINAL
		deferred
		end

	serialise_occurrences(a_node: C_OBJECT; depth: INTEGER) is
			-- any positive range
		deferred
		end

	serialise_existence(a_node: C_ATTRIBUTE; depth: INTEGER) is
			-- can only  be a range of 0..1 or 1..1
		deferred
		end

	serialise_cardinality(a_node: C_ATTRIBUTE; depth: INTEGER) is
			-- includes a range and possibly ordered, unique qualifiers
		deferred
		end

feature {NONE} -- Implementation

	ontology: ARCHETYPE_ONTOLOGY

end


--|
--| ***** BEGIN LICENSE BLOCK *****
--| Version: MPL 1.1/GPL 2.0/LGPL 2.1
--|
--| The contents of this file are subject to the Mozilla Public License Version
--| 1.1 (the 'License'); you may not use this file except in compliance with
--| the License. You may obtain a copy of the License at
--| http://www.mozilla.org/MPL/
--|
--| Software distributed under the License is distributed on an 'AS IS' basis,
--| WITHOUT WARRANTY OF ANY KIND, either express or implied. See the License
--| for the specific language governing rights and limitations under the
--| License.
--|
--| The Original Code is constraint_model_visitor.e.
--|
--| The Initial Developer of the Original Code is Thomas Beale.
--| Portions created by the Initial Developer are Copyright (C) 2007
--| the Initial Developer. All Rights Reserved.
--|
--| Contributor(s):
--|
--| Alternatively, the contents of this file may be used under the terms of
--| either the GNU General Public License Version 2 or later (the 'GPL'), or
--| the GNU Lesser General Public License Version 2.1 or later (the 'LGPL'),
--| in which case the provisions of the GPL or the LGPL are applicable instead
--| of those above. If you wish to allow use of your version of this file only
--| under the terms of either the GPL or the LGPL, and not to allow others to
--| use your version of this file under the terms of the MPL, indicate your
--| decision by deleting the provisions above and replace them with the notice
--| and other provisions required by the GPL or the LGPL. If you do not delete
--| the provisions above, a recipient may use your version of this file under
--| the terms of any one of the MPL, the GPL or the LGPL.
--|
--| ***** END LICENSE BLOCK *****
--|
