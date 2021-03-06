note
	component:   "openEHR ADL Tools"
	description: "Sub-tool for description / meta-data parts of an RM"
	keywords:    "RM, archetype, schema"
	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2011 Ocean Informatics Pty Ltd"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class GUI_RM_DESCRIPTION_CONTROLS

inherit
	GUI_RM_TARGETTED_TOOL

create
	make

feature -- Definitions

	Grid_attr_group_col: INTEGER = 1
	Grid_attr_col: INTEGER = 2
	grid_attr_val_col: INTEGER = 3
	Grid_column_ids: ARRAY [INTEGER]
		once
			Result := <<Grid_attr_group_col, Grid_attr_col, grid_attr_val_col>>
		end

feature {NONE} -- Initialisation

	make
		do
			-- create widgets
			create ev_root_container
			create ev_grid

			-- connect them together
			ev_root_container.extend (ev_grid)

			-- set visual characteristics
			ev_root_container.set_padding (Default_padding_width)
			ev_root_container.set_border_width (Default_border_width)

			ev_grid.disable_row_height_fixed
			ev_root_container.set_data (Current)
		end

feature -- Access

	ev_root_container: EV_VERTICAL_BOX

feature {NONE} -- Implementation

	ev_grid: EV_GRID

	do_clear
			-- Wipe out content.
		do
			ev_grid.wipe_out
		end

	do_populate
		do
			populate_grid
		end

	populate_grid
		local
			gli: EV_GRID_LABEL_ITEM
			str: STRING
			ref_model: BMM_MODEL
		do
			check attached source as s then
				ref_model := s
			end

			ev_grid.wipe_out
			ev_grid.enable_column_resize_immediate

			-- column names
			ev_grid.insert_new_column (Grid_attr_group_col)
			ev_grid.column (Grid_attr_group_col).set_title (get_msg (ec_rm_desc_attr_group, Void))

			ev_grid.insert_new_column (Grid_attr_col)
			ev_grid.column (Grid_attr_col).set_title (get_msg (ec_rm_desc_attr_name, Void))

			ev_grid.insert_new_column (grid_attr_val_col)
			ev_grid.column (grid_attr_val_col).set_title (get_msg (ec_rm_desc_attr_value, Void))

			-- schema id attributes
			create gli.make_with_text ("Schema identification")
			ev_grid.set_item (Grid_attr_group_col, ev_grid.row_count + 1, gli)

			create gli.make_with_text ("rm_publisher")
			ev_grid.set_item (Grid_attr_col, ev_grid.row_count + 1, gli)
			create gli.make_with_text (safe_source.rm_publisher)
			ev_grid.set_item (grid_attr_val_col, ev_grid.row_count, gli)

			create gli.make_with_text ("schema_name")
			ev_grid.set_item (Grid_attr_col, ev_grid.row_count + 1, gli)
			create gli.make_with_text (safe_source.schema_name)
			ev_grid.set_item (grid_attr_val_col, ev_grid.row_count, gli)

			create gli.make_with_text ("rm_release")
			ev_grid.set_item (Grid_attr_col, ev_grid.row_count + 1, gli)
			create gli.make_with_text (safe_source.rm_release)
			ev_grid.set_item (grid_attr_val_col, ev_grid.row_count, gli)

			create gli.make_with_text ("schema_id")
			ev_grid.set_item (Grid_attr_col, ev_grid.row_count + 1, gli)
			create gli.make_with_text (safe_source.schema_id)
			ev_grid.set_item (grid_attr_val_col, ev_grid.row_count, gli)

			-- schema documentation attributes
			create gli.make_with_text ("Schema documentation")
			ev_grid.set_item (Grid_attr_group_col, ev_grid.row_count + 1, gli)

			create gli.make_with_text ("schema_author")
			ev_grid.set_item (Grid_attr_col, ev_grid.row_count + 1, gli)
			create gli.make_with_text (safe_source.schema_author)
			ev_grid.set_item (grid_attr_val_col, ev_grid.row_count, gli)

			create gli.make_with_text ("schema_contributors")
			ev_grid.set_item (Grid_attr_col, ev_grid.row_count + 1, gli)
			create str.make_empty
			across ref_model.schema_contributors as contribs_csr loop
				if contribs_csr.target_index > 1 then
					str.append (",%N")
				end
				str.append (contribs_csr.item)
			end
			create gli.make_with_text (str)
			ev_grid.set_item (grid_attr_val_col, ev_grid.row_count, gli)
			ev_grid.row (ev_grid.row_count).set_height (ev_grid.row (ev_grid.row_count).height * source.schema_contributors.count)

			create gli.make_with_text ("schema_lifecycle_state")
			ev_grid.set_item (Grid_attr_col, ev_grid.row_count + 1, gli)
			create gli.make_with_text (safe_source.schema_lifecycle_state)
			ev_grid.set_item (grid_attr_val_col, ev_grid.row_count, gli)

			create gli.make_with_text ("schema_description")
			ev_grid.set_item (Grid_attr_col, ev_grid.row_count + 1, gli)
			create gli.make_with_text ("View")
			gli.set_pixmap (get_icon_pixmap ("tool/edit"))
			gli.select_actions.extend (agent show_text_in_dialog (source.schema_description))
			ev_grid.set_item (grid_attr_val_col, ev_grid.row_count, gli)

			-- archetyping attributes
			create gli.make_with_text ("Archetyping")
			ev_grid.set_item (Grid_attr_group_col, ev_grid.row_count + 1, gli)

			create gli.make_with_text ("archetype_parent_class")
			ev_grid.set_item (Grid_attr_col, ev_grid.row_count + 1, gli)
			if attached ref_model.archetype_parent_class as apc then
				create gli.make_with_text (apc)
				ev_grid.set_item (grid_attr_val_col, ev_grid.row_count, gli)
			end

			create gli.make_with_text ("archetype_data_value_parent_class")
			ev_grid.set_item (Grid_attr_col, ev_grid.row_count + 1, gli)
			if attached ref_model.archetype_data_value_parent_class as dvpc then
				create gli.make_with_text (dvpc)
				ev_grid.set_item (grid_attr_val_col, ev_grid.row_count, gli)
			end

			create gli.make_with_text ("archetype_rm_closure_packages")
			ev_grid.set_item (Grid_attr_col, ev_grid.row_count + 1, gli)
			create str.make_empty
			across ref_model.archetype_rm_closure_packages as rm_closures_csr loop
				if rm_closures_csr.target_index > 1 then
					str.append (",%N")
				end
				str.append (rm_closures_csr.item)
			end
			create gli.make_with_text (str)
			ev_grid.set_item (grid_attr_val_col, ev_grid.row_count, gli)
			ev_grid.row (ev_grid.row_count).set_height (ev_grid.row (ev_grid.row_count).height * ref_model.archetype_rm_closure_packages.count)

			-- resize grid cols properly
			Grid_column_ids.do_all (
				agent (i: INTEGER)
					do
						ev_grid.column(i).resize_to_content
						ev_grid.column(i).set_width ((ev_grid.column (i).width * 1.2).ceiling)
					end
			)

		end

	show_text_in_dialog (a_text: STRING)
		local
			info_dialog: EV_INFORMATION_DIALOG
		do
			create info_dialog.make_with_text (a_text)
			info_dialog.show
		end

end



