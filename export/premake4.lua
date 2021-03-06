solution "TP"
	configurations { "debug", "release", "gprof" }
    
		local gkit_files = 
		{
			"gKit/*.cpp", "gKit/*.h",
			"gKit/GL/*.cpp", "gKit/GL/*.h",
			"gKit/Widgets/*.cpp", "gKit/Widgets/*.h",
		}
		
		includedirs
		{
			".",
			"gKit",
		}
		
		defines { "GK_OPENGL4", "VERBOSE" }
		
		configuration "debug"
			defines { "DEBUG" } 
			flags { "Symbols" }
		
		configuration "release"
--~ 			defines { "NDEBUG" }
			flags { "OptimizeSpeed" }
		
		configuration "linux"
			buildoptions { "-W -Wall -Wno-unused-parameter -std=c++11", "-pipe" }
			
			-- local glew_include= "/home/gurps/Master\ 2/Rendu3D/TP1/export/gKit2/local/linux/include/GL"
			-- local glew_lib= "$(PWD)/local/linux/lib"
			
			-- local sdl2_include= "/home/gurps/Master\ 2/Rendu3D/TP1/export/gKit2/local/linux/include/SDL2"
			-- local sdl2_lib= "$(PWD)/local/linux/lib"
			
			-- includedirs { sdl2_include, glew_include }
			
			-- linkoptions { "-L" .. glew_lib }
			-- linkoptions { "-Wl,-rpath," .. glew_lib}
			
			-- linkoptions { "-L" .. sdl2_lib }
			-- linkoptions { "-Wl,-rpath," .. sdl2_lib }
			
--			includedirs { "/usr/include/OpenEXR" }
--			links{ "IlmImf", "IlmThread", "Imath", "Half" }
			
			links { "GLEW", "SDL2", "SDL2_image", "SDL2_ttf" }
			links { "GL", "glfw" }
			
		configuration { "linux", "release" }
			buildoptions { "-mtune=native" }
--~ 			buildoptions { "-fopenmp" }
--~ 			linkoptions{ "-fopenmp" }

		configuration "windows"
			includedirs { "local/windows/include" }
			libdirs { "local/windows/lib32" }
			defines { "WIN32", "NVWIDGETS_EXPORTS", "_USE_MATH_DEFINES", "_CRT_SECURE_NO_WARNINGS" }
			defines { "NOMINMAX" } -- allow std::min() and std::max() in vc++ :(((  
			links { "opengl32", "glu32", "glew32", "SDL2", "SDL2main", "SDL2_image", "SDL2_ttf" }

-- pour mac osX, avant premake : le plus simple est d'installer macports (http://www.macports.org/) pour glew et OpenEXR
-- Apres installation : sudo port install OpenEXR, sudo port install glew
-- En cas d'utilisation de Homebrew, remplacer "/opt/local" par "/usr/local" dans "includedirs" et "libdirs"
-- SDL2 n'est pas disponible sur macports. Telecharger SLD2, SDL2_image et SDL2_TTF depuis www.libsdl.org, puis copier les frameworks dans /library/frameworks
-- Attention : depuis le finder, "library" s'appelle "Bibliotheque".
		configuration "macosx"
			defines { "APPLE_OSX" }
			
			includedirs { "/opt/local/include", "/opt/local/include/OpenEXR" }
			libdirs { "/opt/local/lib" }
			buildoptions { "-framework OpenGL -framework Cocoa -framework SDL2 -framework SDL2_image -framework SDL2_ttf" }
			linkoptions { "-framework OpenGL -framework Cocoa -framework SDL2 -framework SDL2_image -framework SDL2_ttf" }
			links { "GLEW" }
			links { "IlmImf", "IlmThread", "Imath", "Half" }


local project_files = {
	"tutorial1",
	"tutorial2",
	"tutorial3",
	"tuto_ray1",
	"image_viewer",
	"mesh_viewer",
	"shader_kit",
	"compute_kit",
	"filter_tutorial1",
	"filter_compute_tutorial1",
	"tp1", 
	"tp1sphere_reyes",
	"tp1shader",
	"batch_perf",
	"tessellation_tuto",
	"tessellation_sphere",
	"compute_tutorial1",
	"compute_tutorial2",
	"compute_tutorial3",
}

for i, name in ipairs(project_files) do
	project(name)
		language "C++"
		kind "ConsoleApp"
		files ( gkit_files )
		files { name..'.cpp' }
end

