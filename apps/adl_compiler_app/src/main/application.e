note
	description : "[
				   This application simulates what a real application written in C, Java or another langauge might do, 
				   across the language interface. To see a C-language equivalent, go to the directory deployment/C/
				   c_tester_for_adl_compiler.
				   ]"
	date        : "$Date$"
	revision    : "$Revision$"

class
	APPLICATION

inherit
	ARGUMENTS

	SHARED_APP_ROOT

create
	make

feature -- Initialization

	make
			-- Run application.
		do
			app_root.initialise_shell
			if app_root.ready_to_initialise_app then
				main
			end
		end

	main
		local
			repo_table: REPOSITORY_CONFIG_TABLE
			new_repo: STRING
		do
			app_root.initialise_app
			if not app_root.has_errors then
				if rm_schemas_access.found_valid_schemas then
					print (get_msg ("cfg_file_path_info", <<app_root.user_config_file_path>>) + "%N")
					print (get_text ("rep_profiles_found_info")  + "%N")
					repo_table := app_root.repository_config_table
					if not repo_table.is_empty then
						across repo_table as repos_csr loop
							print (repos_csr.key + "%N")
						end
						if app_root.repository_config_table.is_empty then
							new_repo := repo_table.first_repository
						else
							new_repo := app_root.repository_config_table.current_repository_name
						end
						app_root.repository_config_table.set_current_repository_name (new_repo)

						print (get_text ("rep_populate_progress_info"))
						app_root.use_current_repository (False)

						print (get_text ("rep_populate_progress_info") + "%N")
						app_root.archetype_compiler.set_global_visual_update_action (agent compiler_global_gui_update)
						app_root.archetype_compiler.set_archetype_visual_update_action (agent compiler_archetype_gui_update)
						app_root.archetype_compiler.build_all
					else
						print (get_text ("rep_profiles_not_found_info") + "%N")
					end
				else
					print (get_text ("app_exit_with_errors") + "%N")
				end
			else
				io.put_string (app_root.errors.as_string)
				print (app_root.error_strings)
				print (rm_schemas_access.error_strings)
			end
		end

	compiler_global_gui_update (msg: attached STRING)
			-- Update UI with progress on build.
		do
			print (msg)
		end

	compiler_archetype_gui_update (msg: attached STRING; ara: ARCH_CAT_ARCHETYPE; depth: INTEGER)
			-- Update UI with progress on build.
		do
			print (msg)
		end

end
