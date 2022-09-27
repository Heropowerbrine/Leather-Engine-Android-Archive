package modding;

import polymod.Polymod;
import modding.ModList;

class PolymodHandler
{
    public static var metadataArrays:Array<String> = [];
    private static final MOD_DIR:String = 'mods';


    public static function loadMods(folders:Array<String>):Void
    {
        loadModMetadata();

		Polymod.init({
			modRoot: SUtil.getPath() + MOD_DIR,
			dirs: ModList.getActiveMods(metadataArrays),
            framework: OPENFL,
			errorCallback: function(error:PolymodError)
			{
				#if debug
                trace(error.message);
                #end
			},
            frameworkParams: {
                assetLibraryPaths: [
                    "songs" => "songs",
                    "stages" => "stages",
                    "shared" => "shared",
                    "replays" => "replays",
                    "fonts" => "fonts", 
                    "mods" => "mods"
                ]
            }
		});
    }

    public static function loadModMetadata()
    {
        metadataArrays = [];

        var tempArray = Polymod.scan(SUtil.getPath() + "mods/","*.*.*",function(error:PolymodError) {
            #if debug
			trace(error.message);
            #end
		});

        for(metadata in tempArray)
        {
            metadataArrays.push(metadata.id);
            ModList.modMetadatas.set(metadata.id, metadata);
        }
    }
}
