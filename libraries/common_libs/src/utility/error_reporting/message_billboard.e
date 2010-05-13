note
	component:   "openEHR Reusable Libraries"
	description: "[
			     Message billboard for posting and reading information and errors.
				 Designed to be inherited into other classes wanting to post
				 messages.
				 ]"
	keywords:    "error status reporting"

	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2005 Ocean Informatics Pty Ltd"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

class MESSAGE_BILLBOARD

inherit
	SHARED_RESOURCES
		export
			{NONE} all
		end

	SHARED_MESSAGE_DB
		export
			{NONE} all
		end

feature -- Access

	billboard_content: STRING
			-- text of the billboard in locale current language
		do
			Result := filtered_billboard_content(status_reporting_level)
		end

	billboard_count: INTEGER
			-- return number of messages currently posted
		do
			Result := billboard.count
		end

feature -- Status Report

	billboard_empty: BOOLEAN
			-- True if there are messages posted at the moment
		do
			Result := billboard.is_empty
		end

	billboard_has_errors: BOOLEAN
			-- True if billboard has any error messages (note: it may be non-empty
			-- and still have no error messages, just info messages)
		do
			from
				billboard.start
			until
				Result or billboard.off
			loop
				Result := billboard.item.message_type = Message_type_error
				billboard.forth
			end
		end

feature -- Modify

	clear_billboard
			-- wipe out error billboard and set is_error_posted False
		do
			billboard.wipe_out
		end

	post_error(poster_object: ANY; poster_routine: STRING; id: STRING; args: ARRAY[STRING])
			-- append to the  current contents of billboard an error message
			-- corresponding to id, with positional parameters replaced
			-- by contents of optional args
		require
			Poster_valid: poster_object /= Void and poster_routine /= Void and
						  not poster_routine.is_empty
		do
			billboard.put_front(
				create {MESSAGE_BILLBOARD_ITEM}.make(poster_object.generator, poster_routine, id, args, Message_type_error))
		ensure
			Error_posted: billboard_has_errors
		end

	post_warning(poster_object: ANY; poster_routine: STRING; id: STRING; args: ARRAY[STRING])
			-- append to the  current contents of billboard a warning message
			-- corresponding to id, with positional parameters replaced
			-- by contents of optional args
		require
			Poster_valid: poster_object /= Void and poster_routine /= Void and
						  not poster_routine.is_empty
		do
			billboard.put_front(
				create {MESSAGE_BILLBOARD_ITEM}.make(poster_object.generator, poster_routine, id, args, Message_type_warning))
		ensure
			Warning_posted: not billboard_empty
		end

	post_info(poster_object: ANY; poster_routine: STRING; id: STRING; args: ARRAY[STRING])
			-- append to the  current contents of billboard an info message
			-- corresponding to id, with positional parameters replaced
			-- by contents of optional args
		require
			Poster_valid: poster_object /= Void and poster_routine /= Void and
						  not poster_routine.is_empty
		do
			billboard.put_front(
				create {MESSAGE_BILLBOARD_ITEM}.make(poster_object.generator, poster_routine, id, args, Message_type_info))
		ensure
			Info_posted: not billboard_empty
		end

feature {NONE} -- Implementation

	billboard: ARRAYED_LIST [MESSAGE_BILLBOARD_ITEM]
		once
			create Result.make(0)
		end

	filtered_billboard_content(at_level: INTEGER): STRING
			-- text of the billboard in locale current language, filtered according to include_types
		require
			at_level_valid: is_valid_message_type (at_level)
		local
			bb_item: MESSAGE_BILLBOARD_ITEM
		do
			create Result.make(0)
			from
				billboard.start
			until
				billboard.off
			loop
				bb_item := billboard.item
				if bb_item.message_type >= at_level then
					Result.append(billboard_item_formatted(bb_item, at_level))
				end
				billboard.forth
			end
		end

	billboard_item_formatted(bb_item: MESSAGE_BILLBOARD_ITEM; at_level: INTEGER): STRING
			-- format one item
		local
			err_str, leader, trailer: STRING
		do
			create Result.make(0)
			leader := Message_type_names.item(bb_item.message_type) + " - "
			if at_level = Message_type_debug then
				trailer := "      (" + bb_item.type_name + "." + bb_item.routine_name + ")"
			else
				trailer := ""
			end
			if message_db.has_message(bb_item.message_id) then
				err_str := message_db.create_message_content(bb_item.message_id, bb_item.args)
			else
				err_str := message_db.create_message_content("message_code_error", Void)
			end
			Result.append(leader)
			Result.append(err_str)
			Result.append(trailer)
			Result.append("%N")
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
--| The Original Code is billboard.e.
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


