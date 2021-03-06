note
	component:   "openEHR ADL Tools"
	description: "Editor plug-in for ARCH_CAT_ARCHETYPE"
	keywords:    "ADL, archetype, editing"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2012 Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class ALA_EDITOR_STATE

create
	make

feature -- Initialisation

	make (aca: ARCH_LIB_ARCHETYPE)
		do
			target := aca
		end

	set_editable (an_undo_redo_chain: UNDO_REDO_CHAIN)
		require
			target.is_valid
		do
			if not attached editor_ui_graph then
				create editor_ui_graph.make_editable (target, target.ref_model, an_undo_redo_chain)
			end
		ensure
			attached editor_ui_graph
		end

feature -- Access

	target: ARCH_LIB_ARCHETYPE

	differential_ui_graph: ARCHETYPE_UI_GRAPH_ROOT
		do
			if attached differential_ui_graph_cache as ddcc then
				Result := ddcc
			else
				create Result.make (target, target.ref_model, True)
				differential_ui_graph_cache := Result
			end
		end

	flat_ui_graph: ARCHETYPE_UI_GRAPH_ROOT
		do
			if attached flat_ui_graph_cache as fdcc then
				Result := fdcc
			else
				create Result.make (target, target.ref_model, False)
				flat_ui_graph_cache := Result
			end
		end

	editor_ui_graph: detachable ARCHETYPE_UI_GRAPH_ROOT

	select_ui_graph (differential_view, editing_enabled: BOOLEAN): ARCHETYPE_UI_GRAPH_ROOT
			-- display / editor context, loaded with archetype for display, or a clone, for editing
		do
			if not editing_enabled then
				if differential_view then
					Result := differential_ui_graph
				else
					Result := flat_ui_graph
				end
			else
				check attached editor_ui_graph as att_graph then
					Result := att_graph
				end
			end
		end

feature -- Commands

	on_commit
		do
			differential_ui_graph_cache := Void
			flat_ui_graph_cache := Void
		end

feature {NONE} -- Implementation

	differential_ui_graph_cache: detachable ARCHETYPE_UI_GRAPH_ROOT
			-- differential archetype UI graph

	flat_ui_graph_cache: detachable ARCHETYPE_UI_GRAPH_ROOT
			-- differential archetype UI graph

end



