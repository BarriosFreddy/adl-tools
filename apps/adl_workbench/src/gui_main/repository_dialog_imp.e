note
	description: "[
		Objects that represent an EV_DIALOG.
		The original version of this class was generated by EiffelBuild.
		This class is the implementation of an EV_DIALOG generated by EiffelBuild.
		You should not modify this code by hand, as it will be re-generated every time
		 modifications are made to the project.
		 	]"
	generator: "EiffelBuild"
	date: "$Date$"
	revision: "$Revision$"

deferred class
	REPOSITORY_DIALOG_IMP

inherit
	EV_DIALOG
		redefine
			create_interface_objects, initialize, is_in_default_state
		end
			
	CONSTANTS
		undefine
			is_equal, default_create, copy
		end

feature {NONE}-- Initialization

	initialize
			-- Initialize `Current'.
		do
			Precursor {EV_DIALOG}
			initialize_constants

			
				-- Build widget structure.
			extend (l_ev_vertical_box_1)
			l_ev_vertical_box_1.extend (profile_frame)
			profile_frame.extend (l_ev_horizontal_box_1)
			l_ev_horizontal_box_1.extend (profile_list)
			l_ev_horizontal_box_1.extend (l_ev_vertical_box_2)
			l_ev_vertical_box_2.extend (profile_add_button)
			l_ev_vertical_box_2.extend (profile_remove_button)
			l_ev_vertical_box_2.extend (profile_edit_button)
			l_ev_vertical_box_1.extend (ref_path_hbox)
			ref_path_hbox.extend (reference_path_text)
			l_ev_vertical_box_1.extend (work_path_hbox)
			work_path_hbox.extend (work_path_text)
			l_ev_vertical_box_1.extend (l_ev_horizontal_box_2)
			l_ev_horizontal_box_2.extend (l_ev_cell_1)
			l_ev_horizontal_box_2.extend (ok_button)
			l_ev_horizontal_box_2.extend (cancel_button)

			l_ev_vertical_box_1.set_minimum_height (220)
			integer_constant_set_procedures.extend (agent l_ev_vertical_box_1.set_padding (?))
			integer_constant_retrieval_functions.extend (agent padding_width)
			integer_constant_set_procedures.extend (agent l_ev_vertical_box_1.set_border_width (?))
			integer_constant_retrieval_functions.extend (agent border_width)
			l_ev_vertical_box_1.disable_item_expand (ref_path_hbox)
			l_ev_vertical_box_1.disable_item_expand (work_path_hbox)
			l_ev_vertical_box_1.disable_item_expand (l_ev_horizontal_box_2)
			profile_frame.set_text ("Profiles")
			profile_frame.set_minimum_height (120)
			l_ev_horizontal_box_1.set_minimum_height (110)
			integer_constant_set_procedures.extend (agent l_ev_horizontal_box_1.set_padding (?))
			integer_constant_retrieval_functions.extend (agent padding_width)
			integer_constant_set_procedures.extend (agent l_ev_horizontal_box_1.set_border_width (?))
			integer_constant_retrieval_functions.extend (agent border_width)
			l_ev_horizontal_box_1.disable_item_expand (l_ev_vertical_box_2)
			profile_list.set_minimum_height (100)
			l_ev_vertical_box_2.set_minimum_width (100)
			integer_constant_set_procedures.extend (agent l_ev_vertical_box_2.set_padding (?))
			integer_constant_retrieval_functions.extend (agent padding_width)
			integer_constant_set_procedures.extend (agent l_ev_vertical_box_2.set_border_width (?))
			integer_constant_retrieval_functions.extend (agent border_width)
			l_ev_vertical_box_2.disable_item_expand (profile_add_button)
			l_ev_vertical_box_2.disable_item_expand (profile_remove_button)
			l_ev_vertical_box_2.disable_item_expand (profile_edit_button)
			profile_add_button.set_text ("Add New")
			profile_add_button.set_tooltip ("Add a new profile")
			profile_remove_button.set_text ("Remove")
			profile_remove_button.set_tooltip ("Remove selected profile")
			profile_edit_button.set_text ("Edit")
			profile_edit_button.set_tooltip ("Edit selected profile")
			ref_path_hbox.set_text ("Reference repository")
			reference_path_text.disable_edit
			work_path_hbox.set_text ("Work repository")
			work_path_text.disable_edit
			l_ev_horizontal_box_2.set_padding (15)
			integer_constant_set_procedures.extend (agent l_ev_horizontal_box_2.set_border_width (?))
			integer_constant_retrieval_functions.extend (agent border_width)
			l_ev_horizontal_box_2.disable_item_expand (ok_button)
			l_ev_horizontal_box_2.disable_item_expand (cancel_button)
			ok_button.set_text ("OK")
			ok_button.set_minimum_width (100)
			ok_button.set_minimum_height (26)
			cancel_button.set_text ("Cancel")
			cancel_button.set_minimum_width (100)
			cancel_button.set_minimum_height (26)
			set_minimum_width (500)
			set_minimum_height (280)
			set_maximum_width (800)
			set_maximum_height (800)
			set_title ("ADL Workbench Repository Profile Configuration")

			set_all_attributes_using_constants
			
				-- Connect events.
			profile_list.select_actions.extend (agent on_select_profile)
			profile_add_button.select_actions.extend (agent add_new_profile)
			profile_remove_button.select_actions.extend (agent remove_selected_profile)
			profile_edit_button.select_actions.extend (agent edit_selected_profile)
			ok_button.select_actions.extend (agent on_ok)
			show_actions.extend (agent on_show)

				-- Call `user_initialization'.
			user_initialization
		end
		
	create_interface_objects
			-- Create objects
		do
			
				-- Create all widgets.
			create l_ev_vertical_box_1
			create profile_frame
			create l_ev_horizontal_box_1
			create profile_list
			create l_ev_vertical_box_2
			create profile_add_button
			create profile_remove_button
			create profile_edit_button
			create ref_path_hbox
			create reference_path_text
			create work_path_hbox
			create work_path_text
			create l_ev_horizontal_box_2
			create l_ev_cell_1
			create ok_button
			create cancel_button

			create string_constant_set_procedures.make (10)
			create string_constant_retrieval_functions.make (10)
			create integer_constant_set_procedures.make (10)
			create integer_constant_retrieval_functions.make (10)
			create pixmap_constant_set_procedures.make (10)
			create pixmap_constant_retrieval_functions.make (10)
			create integer_interval_constant_retrieval_functions.make (10)
			create integer_interval_constant_set_procedures.make (10)
			create font_constant_set_procedures.make (10)
			create font_constant_retrieval_functions.make (10)
			create pixmap_constant_retrieval_functions.make (10)
			create color_constant_set_procedures.make (10)
			create color_constant_retrieval_functions.make (10)
		end


feature -- Access

	l_ev_vertical_box_1, l_ev_vertical_box_2: EV_VERTICAL_BOX
	profile_frame, ref_path_hbox, work_path_hbox: EV_FRAME
	l_ev_horizontal_box_1,
	l_ev_horizontal_box_2: EV_HORIZONTAL_BOX
	profile_list: EV_LIST
	profile_add_button, profile_remove_button, profile_edit_button,
	ok_button, cancel_button: EV_BUTTON
	reference_path_text, work_path_text: EV_TEXT_FIELD
	l_ev_cell_1: EV_CELL

feature {NONE} -- Implementation

	is_in_default_state: BOOLEAN
			-- Is `Current' in its default state?
		do
			-- Re-implement if you wish to enable checking
			-- for `Current'.
			Result := True
		end

	user_initialization
			-- Feature for custom initialization, called at end of `initialize'.
		deferred
		end
	
	on_select_profile is
			-- Called by `select_actions' of `profile_list'.
		deferred
		end
	
	add_new_profile is
			-- Called by `select_actions' of `profile_add_button'.
		deferred
		end
	
	remove_selected_profile is
			-- Called by `select_actions' of `profile_remove_button'.
		deferred
		end
	
	edit_selected_profile is
			-- Called by `select_actions' of `profile_edit_button'.
		deferred
		end
	
	on_ok is
			-- Called by `select_actions' of `ok_button'.
		deferred
		end
	
	on_show is
			-- Called by `show_actions' of `repository_dialog'.
		deferred
		end
	

feature {NONE} -- Constant setting

	set_attributes_using_string_constants
			-- Set all attributes relying on string constants to the current
			-- value of the associated constant.
		local
			s: detachable STRING_32
		do
			from
				string_constant_set_procedures.start
			until
				string_constant_set_procedures.off
			loop
				string_constant_retrieval_functions.i_th (string_constant_set_procedures.index).call (Void)
				s := string_constant_retrieval_functions.i_th (string_constant_set_procedures.index).last_result
				if s /= Void then
					string_constant_set_procedures.item.call ([s])
				end
				string_constant_set_procedures.forth
			end
		end

	set_attributes_using_integer_constants
			-- Set all attributes relying on integer constants to the current
			-- value of the associated constant.
		local
			i: INTEGER
			arg1, arg2: INTEGER
			int: INTEGER_INTERVAL
		do
			from
				integer_constant_set_procedures.start
			until
				integer_constant_set_procedures.off
			loop
				integer_constant_retrieval_functions.i_th (integer_constant_set_procedures.index).call (Void)
				i := integer_constant_retrieval_functions.i_th (integer_constant_set_procedures.index).last_result
				integer_constant_set_procedures.item.call ([i])
				integer_constant_set_procedures.forth
			end
			from
				integer_interval_constant_retrieval_functions.start
				integer_interval_constant_set_procedures.start
			until
				integer_interval_constant_retrieval_functions.off
			loop
				integer_interval_constant_retrieval_functions.item.call (Void)
				arg1 := integer_interval_constant_retrieval_functions.item.last_result
				integer_interval_constant_retrieval_functions.forth
				integer_interval_constant_retrieval_functions.item.call (Void)
				arg2 := integer_interval_constant_retrieval_functions.item.last_result
				create int.make (arg1, arg2)
				integer_interval_constant_set_procedures.item.call ([int])
				integer_interval_constant_retrieval_functions.forth
				integer_interval_constant_set_procedures.forth
			end
		end

	set_attributes_using_pixmap_constants
			-- Set all attributes relying on pixmap constants to the current
			-- value of the associated constant.
		local
			p: detachable EV_PIXMAP
		do
			from
				pixmap_constant_set_procedures.start
			until
				pixmap_constant_set_procedures.off
			loop
				pixmap_constant_retrieval_functions.i_th (pixmap_constant_set_procedures.index).call (Void)
				p := pixmap_constant_retrieval_functions.i_th (pixmap_constant_set_procedures.index).last_result
				if p /= Void then
					pixmap_constant_set_procedures.item.call ([p])
				end
				pixmap_constant_set_procedures.forth
			end
		end

	set_attributes_using_font_constants
			-- Set all attributes relying on font constants to the current
			-- value of the associated constant.
		local
			f: detachable EV_FONT
		do
			from
				font_constant_set_procedures.start
			until
				font_constant_set_procedures.off
			loop
				font_constant_retrieval_functions.i_th (font_constant_set_procedures.index).call (Void)
				f := font_constant_retrieval_functions.i_th (font_constant_set_procedures.index).last_result
				if f /= Void then
					font_constant_set_procedures.item.call ([f])
				end
				font_constant_set_procedures.forth
			end	
		end

	set_attributes_using_color_constants
			-- Set all attributes relying on color constants to the current
			-- value of the associated constant.
		local
			c: detachable EV_COLOR
		do
			from
				color_constant_set_procedures.start
			until
				color_constant_set_procedures.off
			loop
				color_constant_retrieval_functions.i_th (color_constant_set_procedures.index).call (Void)
				c := color_constant_retrieval_functions.i_th (color_constant_set_procedures.index).last_result
				if c /= Void then
					color_constant_set_procedures.item.call ([c])
				end
				color_constant_set_procedures.forth
			end
		end

	set_all_attributes_using_constants
			-- Set all attributes relying on constants to the current
			-- calue of the associated constant.
		do
			set_attributes_using_string_constants
			set_attributes_using_integer_constants
			set_attributes_using_pixmap_constants
			set_attributes_using_font_constants
			set_attributes_using_color_constants
		end
	
	string_constant_set_procedures: ARRAYED_LIST [PROCEDURE [ANY, TUPLE [STRING_GENERAL]]]
	string_constant_retrieval_functions: ARRAYED_LIST [FUNCTION [ANY, TUPLE [], STRING_32]]
	integer_constant_set_procedures: ARRAYED_LIST [PROCEDURE [ANY, TUPLE [INTEGER]]]
	integer_constant_retrieval_functions: ARRAYED_LIST [FUNCTION [ANY, TUPLE [], INTEGER]]
	pixmap_constant_set_procedures: ARRAYED_LIST [PROCEDURE [ANY, TUPLE [EV_PIXMAP]]]
	pixmap_constant_retrieval_functions: ARRAYED_LIST [FUNCTION [ANY, TUPLE [], EV_PIXMAP]]
	integer_interval_constant_retrieval_functions: ARRAYED_LIST [FUNCTION [ANY, TUPLE [], INTEGER]]
	integer_interval_constant_set_procedures: ARRAYED_LIST [PROCEDURE [ANY, TUPLE [INTEGER_INTERVAL]]]
	font_constant_set_procedures: ARRAYED_LIST [PROCEDURE [ANY, TUPLE [EV_FONT]]]
	font_constant_retrieval_functions: ARRAYED_LIST [FUNCTION [ANY, TUPLE [], EV_FONT]]
	color_constant_set_procedures: ARRAYED_LIST [PROCEDURE [ANY, TUPLE [EV_COLOR]]]
	color_constant_retrieval_functions: ARRAYED_LIST [FUNCTION [ANY, TUPLE [], EV_COLOR]]

	integer_from_integer (an_integer: INTEGER): INTEGER
			-- Return `an_integer', used for creation of
			-- an agent that returns a fixed integer value.
		do
			Result := an_integer
		end

end
