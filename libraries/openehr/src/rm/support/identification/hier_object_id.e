indexing
	component:   "openEHR Support Reference Model"
	
	description: "[
			 Hierarhical object identifiers. The syntax of the value attribute is as follows:
					 [ root '.' ] extension
			 ]"
	keywords:    "object identifiers"

	design:      "openEHR Common Reference Model 1.4.1"

	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2000-2006 The openEHR Foundation <http://www.openEHR.org>"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

class HIER_OBJECT_ID

inherit
	OBJECT_ID

create
	make
	
feature -- Definitions
	
	Extension_separator: STRING is "::"

feature -- Initialization

	make(a_root: UID; an_extension: STRING) is
			-- build an external ID
		require
			Root_valid: a_root /= Void
			Extension_exists: an_extension /= Void and then not an_extension.is_empty
		do
			create value.make(0)
			if a_root /= Void then
				value.append(a_root.value + Extension_separator)
			end
			value.append(an_extension)
		ensure
			Root_set: a_root /= Void implies root.value.is_equal(a_root.value)
			Extension_set: extension.is_equal(an_extension)
		end
		
	make_from_string(a_string:STRING) is
			-- make from a string of the same form as `id', i.e. "root::extension"
		require
			String_exists: a_string /= Void and then valid_id(a_string)
		do
			
		end
		
feature -- Access

	root: UID is
			-- extract the context id part of the id, if any
		local
			end_pos: INTEGER
			s: STRING
		do
			end_pos := value.substring_index(Extension_separator, 1) - 1
			if end_pos <= 0 then
				end_pos := value.count
			end
			s := value.substring (1, end_pos)
			
			create {UUID} Result.default_create
			if Result.valid_id (s) then
				create {UUID} Result.make(s)
			else	
				create {ISO_OID} Result.default_create
				if Result.valid_id (s) then			
					create {ISO_OID} Result.make(s)
				else
					create {INTERNET_ID} Result.default_create
					if Result.valid_id (s) then			
						create {INTERNET_ID} Result.make(s)
					else
						-- error
					end
				end
			end
		ensure
			Result /= Void
		end

	extension: STRING is
			-- extract the local id part of the id
		require
			has_extension
		do
			Result := value.substring(value.substring_index(Extension_separator, 1) + 
						Extension_separator.count, value.count)
		ensure
			Result /= Void and then not Result.is_empty
		end
		
	has_extension: BOOLEAN is
			-- True if there is a root part - at least one '.' in id before version part
		do
			Result := value.substring_index(Extension_separator, 1) > 0
		end

feature -- Status Report

	valid_id(a_str:STRING): BOOLEAN is
			-- 
		do
			-- Result := 
		end

feature -- Output

	as_string: STRING is
			-- string form displayable for humans - e.g. ICD9;1989::M17(en-au)
		do
			create Result.make(0)
			Result.append(root.value)
			if has_extension then
				Result.append(Extension_separator)
				Result.append(extension)
			end
		end

	as_canonical_string: STRING is
			-- standardised form of string guaranteed to contain all information
			-- in data item
		do
			create Result.make(0)
			Result.append("<root>" + root.value + "</root>")
			if has_extension then
				Result.append("<extension>" + extension + "</extension>")
			end
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
--| The Original Code is hier_object_id.e.
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
