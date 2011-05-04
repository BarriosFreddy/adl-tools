note
	component:   "openEHR Archetype Project"
	description: "Persistent form of archetype used for standard serialisations"
	keywords:    "archetype, persistence"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2011 Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

class P_ARCHETYPE

inherit
	AUTHORED_RESOURCE

	DT_CONVERTIBLE

create
	make, make_dt

feature -- Initialisation

	make_dt (make_args: ARRAY[ANY])
			-- basic make routine to guarantee validity on creation
		do
		end

	make (an_archetype: attached ARCHETYPE)
			-- basic make routine to guarantee validity on creation
		do
			make_from_other (an_archetype)

			archetype_id := an_archetype.archetype_id.as_string
			adl_version := an_archetype.adl_version
			artefact_type := an_archetype.artefact_type.type_name

			if an_archetype.is_specialised then
				parent_archetype_id := an_archetype.parent_archetype_id.as_string
			end

			create definition.make (an_archetype.definition)

			if an_archetype.has_invariants then
				create invariants.make (0)
				from an_archetype.invariants.start until an_archetype.invariants.off loop
					invariants.extend (an_archetype.invariants.item.as_string)
					an_archetype.invariants.forth
				end
			end

			create ontology.make (an_archetype.ontology)

			if attached {OPERATIONAL_TEMPLATE} an_archetype as opt and then attached opt.component_ontologies then
				create component_ontologies.make(0)
				from opt.component_ontologies.start until opt.component_ontologies.off loop
					component_ontologies.put (create {P_ARCHETYPE_ONTOLOGY}.make(opt.component_ontologies.item_for_iteration), opt.component_ontologies.key_for_iteration)
					opt.component_ontologies.forth
				end
			end
		end

feature -- Access

	archetype_id: attached STRING

	adl_version: attached STRING
			-- ADL version of this archetype

	artefact_type: attached STRING
			-- design type of artefact, archetype, template, template-component, etc

	parent_archetype_id: STRING
			-- id of specialisation parent of this archetype

	definition: attached P_C_COMPLEX_OBJECT

	invariants: ARRAYED_LIST [STRING]

	ontology: attached P_ARCHETYPE_ONTOLOGY

	component_ontologies: attached HASH_TABLE [P_ARCHETYPE_ONTOLOGY, STRING]

feature -- Status Report

	has_path (a_path: attached STRING): BOOLEAN
			-- True if `a_path' is found in resource; define in descendants
		do
		end

feature {DT_OBJECT_CONVERTER} -- Conversion

	persistent_attributes: ARRAYED_LIST [STRING]
			-- list of attribute names to persist as DT structure
			-- empty structure means all attributes
		do
		end

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
--| The Original Code is p_archetype.e.
--|
--| The Initial Developer of the Original Code is Thomas Beale.
--| Portions created by the Initial Developer are Copyright (C) 2011
--| the Initial Developer. All Rights Reserved.
--|
--| Contributor(s):
--|	Sam Heard
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