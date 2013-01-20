note
	component:   "openEHR Archetype Project"
	description: "[
				 File-system ad hoc repository of archetypes - where archetypes are not arranged as a tree
				 but may appear anywhere. Items are added to the repository by the user, not by an automatic
				 scan of a directory tree.
				 ]"
	keywords:    "ADL"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2007- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "See notice at bottom of class"

class ARCHETYPE_ADHOC_FILE_REPOSITORY

inherit
	ARCHETYPE_FILE_REPOSITORY_IMP

create
	make

feature {NONE} -- Initialisation

	make (a_group_id: INTEGER)
			-- Create as part of `a_group_id'
		require
			group_id_valid: a_group_id > 0
		do
			group_id := a_group_id
			create archetype_id_index.make (0)
		ensure
			group_id_set: group_id = a_group_id
		end

feature -- Access

	item (full_path: STRING): ARCH_CAT_ARCHETYPE
			-- The archetype at `full_path'.
		require
			has_full_path: has_path (full_path)
		do
			check attached archetype_id_index.item (full_path) as aca then
				Result := aca
			end
		end

feature -- Status Report

	has_path (full_path: STRING): BOOLEAN
			-- Has `full_path' been added to this repository?
		do
			Result := archetype_id_index.has (full_path)
		end

feature -- Modification

	add_item (full_path: STRING)
			-- Add the archetype designated by `full_path' to this repository.
		require
			path_valid: is_valid_path (full_path)
			hasnt_path: not has_path (full_path)
		local
			ara: ARCH_CAT_ARCHETYPE
			amp: ARCHETYPE_MINI_PARSER
			aof: APP_OBJECT_FACTORY
		do
			create aof
			create amp
			amp.parse (full_path)
			if amp.last_parse_valid and then attached amp.last_archetype as arch then
				if arch.archetype_id_is_old_style then
					post_error (Current, "build_directory", "parse_archetype_e7", <<full_path>>)
				elseif arch.is_specialised and then arch.parent_archetype_id_is_old_style then
					post_error (Current, "build_directory", "parse_archetype_e11", <<full_path, arch.parent_archetype_id.as_string>>)
				elseif not has_rm_schema_for_id (arch.archetype_id) then
					post_error (Current, "build_directory", "parse_archetype_e4", <<full_path, arch.archetype_id.as_string>>)
				elseif not archetype_id_index.has (arch.archetype_id.as_string) then
					if adl_legacy_flat_filename_pattern_regex.matches (file_system.basename (full_path)) then
						ara := aof.create_arch_cat_archetype_make_legacy (full_path, Current, arch)
					else
						ara := aof.create_arch_cat_archetype_make (full_path, Current, arch)
					end
					archetype_id_index.force (ara, full_path)
				else
					post_info (Current, "build_directory", "pair_filename_i1", <<full_path>>)
				end
			else
				post_error (Current, "build_directory", "parse_archetype_e5", <<full_path>>)
			end
		ensure
			added_1_or_none: (0 |..| 1).has (archetype_id_index.count - old archetype_id_index.count)
			has_path: archetype_id_index.count > old archetype_id_index.count implies has_path (full_path)
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
--| The Original Code is adl_node_control.e.
--|
--| The Initial Developer of the Original Code is Thomas Beale.
--| Portions created by the Initial Developer are Copyright (C) 2003-2004
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
