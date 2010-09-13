note
	description: "Objects that represent an EV_TITLED_WINDOW.%
		%The original version of this class was generated by EiffelBuild."
	generator: "EiffelBuild"
	date: "$Date$"
	revision: "$Revision$"

class
	MAIN_WINDOW

inherit
	MAIN_WINDOW_IMP
		redefine
			show
		end

	WINDOW_ACCELERATORS
		undefine
			copy,
			default_create
		end

	GUI_UTILITIES
		export
			{NONE} all
		undefine
			copy, default_create
		end

	SHARED_DADL_TEST_OBJECTS
		export
			{NONE} all
		undefine
			copy, default_create
		end

	SHARED_APP_ROOT
		undefine
			copy, default_create
		end

	SHARED_APP_UI_RESOURCES
		undefine
			copy, default_create
		end

feature -- Status setting

	show
			-- Do a few adjustments and load the repository before displaying the window.
		do
			initialise_overall_appearance

			Precursor

			initialise_splitter (explorer_split_area, explorer_split_position)
			initialise_splitter (main_split_area, main_split_position)
			focus_first_widget (main_notebook.selected_item)

			if app_maximised then
				maximize
			end

			if editor_command.is_empty then
				set_editor_command (default_editor_command)
			end

			populate_explorer
			append_billboard_to_status_area
		end

feature {NONE} -- Initialization

	user_initialization
			-- Called by `initialize'.
			-- Any custom user initialization that
			-- could not be performed in `initialize',
			-- (due to regeneration of implementation class)
			-- can be added here.
		do
			initialise_accelerators
			test_objects.initialise (agent append_status_area (?), agent update_source_area (?))
		end

feature -- Events

	select_explorer_item
			-- Called by `select_actions' of `explorer_tree'.
   		local
			a_node: EV_TREE_ITEM
		do
			if attached {EV_TREE_NODE} explorer_tree.selected_item as node then
				if attached {PROCEDURE [ANY, TUPLE[ANY]]} node.parent.data as test_proc then
					test_proc.call ([node.data])
				end
			end
		end

	dadl_engine: DADL_ENGINE
		once
			create Result.make
		end

	on_copy
			-- Called by `select_actions' of `edit_menu_copy'.
		do
		end

	exit_app
			-- Terminate the application, saving the window location.
		do
			set_explorer_split_position (explorer_split_area.split_position)
			set_app_width (width)
			set_app_height (height)
			if not is_minimized then
				set_app_x_position (x_position)
				set_app_y_position (y_position)
			end
			set_app_maximised (is_maximized)
			set_main_notebook_tab_pos (main_notebook.selected_item_index)

			save_resources
			ev_application.destroy
		end

feature {NONE} -- Implementation

	populate_explorer
   		local
			a_node, a_node1, a_node2: EV_TREE_ITEM
			test_item: TUPLE[HASH_TABLE [ANY, STRING], PROCEDURE [ANY, TUPLE[ANY]], STRING]
			test_proc: PROCEDURE [ANY, TUPLE[ANY]]
			tests: HASH_TABLE [ANY, STRING]
			test_group: STRING
		do
			explorer_tree.wipe_out
			create a_node
 			a_node.set_text ("Test groups")
			explorer_tree.extend (a_node)

			from test_objects.test_table.start until test_objects.test_table.off loop
				create a_node1
				test_item := test_objects.test_table.item
				tests ?= test_item.reference_item(1)
				test_proc ?= test_item.reference_item(2)
				test_group ?= test_item.reference_item (3)
		 		a_node1.set_data (test_proc)
		 		a_node1.set_text (test_group)
				a_node.extend (a_node1)
				from tests.start until tests.off loop
					create a_node2
		 			a_node2.set_data (tests.item_for_iteration)
		 			a_node2.set_text (tests.key_for_iteration)
					a_node1.extend (a_node2)
					tests.forth
				end
				test_objects.test_table.forth
			end
		end

	initialise_overall_appearance
			-- Initialise the main properties of the window (size, appearance, title, etc.).
		do
			set_position (app_x_position, app_y_position)

			if app_width > 0 and app_height > 0 then
				set_size (app_width, app_height)
			else
				set_size (app_initial_width, app_initial_height)
			end

			if main_notebook_tab_pos > 1 then
				main_notebook.select_item (main_notebook [main_notebook_tab_pos])
			end
		end

	initialise_accelerators
			-- Initialise keyboard accelerators for various widgets.
		do
			add_menu_shortcut (file_menu_open, key_o, True, False, False)
			add_menu_shortcut (file_menu_save_as, key_s, True, False, False)
			add_menu_shortcut_for_action (edit_menu_copy, agent call_unless_text_focused (agent on_copy), key_c, True, False, False)
			add_menu_shortcut (edit_menu_select_all, key_a, True, False, False)
		end

	append_status_area (text: STRING)
			-- Append `text' to `parser_status_area'.
		require
			text_attached: text /= Void
		do
			status_area.append_text (text)
			ev_application.process_graphical_events
		end

	update_source_area (text: STRING)
			-- Write `text' to `source_text'.
		require
			text_attached: text /= Void
		do
			source_text.set_text (text)
		end

	append_billboard_to_status_area
			-- Append bilboard contents to `parser_status_area' and clear billboard.
		do
			status_area.append_text (billboard.content)
			billboard.clear
			ev_application.process_graphical_events
		end

feature {NONE} -- Standard Windows behaviour that EiffelVision ought to be managing automatically

	focus_first_widget (widget: EV_WIDGET)
			-- Set focus to `widget' or to its first child widget that accepts focus.
		require
			widget_attached: widget /= Void
		local
			widgets: LINEAR [EV_WIDGET]
		do
			if attached {EV_CONTAINER} widget as container and not attached {EV_GRID} widget as grid then
				from
					widgets := container.linear_representation
					widgets.start
				until
					widgets.off or container.has_recursive (ev_application.focused_widget)
				loop
					focus_first_widget (widgets.item)
					widgets.forth
				end
			elseif widget.is_displayed and widget.is_sensitive then
				if not attached {EV_LABEL} widget as label and not attached {EV_TOOL_BAR} widget as toolbar then
					widget.set_focus
				end
			end
		end

	focused_text: EV_TEXT_COMPONENT
			-- The currently focused text widget, if any.
		do
			Result ?= ev_application.focused_widget

			if not has_recursive (Result) then
				Result := Void
			end
		ensure
			focused: Result /= Void implies Result.has_focus
			in_this_window: Result /= Void implies has_recursive (Result)
		end

	call_unless_text_focused (action: PROCEDURE [ANY, TUPLE])
			-- Some of the edit shortcuts are implemented automatically for text boxes (although not for rich text
			-- boxes, or at least not on Windows).
			-- If called from a keyboard shortcut, execute the action unless a text box is focused.
			-- Executing it within a text box would cause it to be performed twice.
			-- For some actions this wouldn't really matter (cut, copy), but for paste it would be a blatant bug.
		local
			t: EV_TEXT_COMPONENT
		do
			t := focused_text

			if t = Void or attached {EV_RICH_TEXT} t then
				action.call ([])
			end
		end

end
